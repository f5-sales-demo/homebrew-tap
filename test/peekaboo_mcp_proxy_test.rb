# frozen_string_literal: true

require "json"
require "minitest/autorun"
require "open3"
require "tmpdir"

class PeekabooMCPProxyTest < Minitest::Test
  PROXY = File.expand_path("../libexec/peekaboo-mcp-proxy", __dir__)

  def setup
    @directory = Dir.mktmpdir("peekaboo-proxy")
    @sentinel = File.join(@directory, "DISABLED")
    @audit = File.join(@directory, "audit.jsonl")
    @received = File.join(@directory, "received.jsonl")
    @child = File.join(@directory, "fake-mcp")
    File.write(@child, <<~RUBY)
      #!/usr/bin/env ruby
      require "json"
      received = ENV.fetch("FAKE_MCP_RECEIVED")
      while (line = STDIN.gets)
        File.open(received, "a") { |file| file.write(line) }
        request = JSON.parse(line)
        response = if request["method"] == "tools/call"
          {jsonrpc: "2.0", id: request["id"], result: {content: [{type: "text", text: "secret-result"}]}}
        else
          {jsonrpc: "2.0", id: request["id"], result: {}}
        end
        STDOUT.puts(JSON.generate(response)) if request.key?("id")
        STDOUT.flush
      end
    RUBY
    File.chmod(0o755, @child)
  end

  def teardown
    FileUtils.remove_entry_secure(@directory)
  end

  def test_sentinel_rejects_before_dispatch_without_leaking_arguments
    File.write(@sentinel, "disabled\n")
    stdout, stderr, status = invoke(call_request(41, secret: "never-log-or-dispatch"))
    assert status.success?, stderr
    assert_equal(-32_001, JSON.parse(stdout).dig("error", "code"))
    refute File.exist?(@received)
    refute_includes File.read(@audit), "never-log-or-dispatch"
    assert_equal "kill_switch", JSON.parse(File.read(@audit))["error_code"]
  end

  def test_enabled_call_relays_and_audits_only_metadata
    stdout, stderr, status = invoke(call_request(42, secret: "private-command"))
    assert status.success?, stderr
    assert_equal "secret-result", JSON.parse(stdout).dig("result", "content", 0, "text")
    assert_includes File.read(@received), "private-command"
    audit = File.read(@audit)
    refute_includes audit, "private-command"
    refute_includes audit, "secret-result"
    record = JSON.parse(audit)
    assert_equal "input", record["category"]
    assert_equal "boo.fixture", record["bundle_id"]
    assert_equal 123, record["pid"]
    assert_equal 456, record["window_id"]
    assert_equal "success", record["outcome"]
  end

  private

  def call_request(id, secret:)
    JSON.generate({
      jsonrpc: "2.0", id: id, method: "tools/call",
      params: {
        name: "click",
        arguments: { "bundle_id" => "boo.fixture", "pid" => 123, "window_id" => 456, "text" => secret },
      },
    }) + "\n"
  end

  def invoke(input)
    Open3.capture3(
      { "FAKE_MCP_RECEIVED" => @received },
      PROXY, "--sentinel", @sentinel, "--audit-log", @audit, "--", @child,
      stdin_data: input,
    )
  end
end
