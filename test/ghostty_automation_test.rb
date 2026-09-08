# frozen_string_literal: true

require "minitest/autorun"
require "tmpdir"
load File.expand_path("../bin/ghostty-automation", __dir__)

class GhosttyAutomationConfigTest < Minitest::Test
  def setup
    @directory = Dir.mktmpdir("ghostty-automation-config")
    @path = File.join(@directory, "config.toml")
    @config = GhosttyAutomation::Config.new(@path, {
      proxy: "/Users/test/Library/Application Support/GhosttyAutomation/bin/peekaboo-mcp-proxy",
      sentinel: "/Users/test/Library/Application Support/GhosttyAutomation/DISABLED",
      audit_log: "/Users/test/Library/Logs/GhosttyAutomation/audit.jsonl",
      peekaboo: "/opt/homebrew/bin/peekaboo",
      socket: "/Users/test/Library/Application Support/Peekaboo/bridge.sock",
    })
  end

  def teardown
    FileUtils.remove_entry_secure(@directory)
  end

  def test_write_is_idempotent_and_preserves_existing_config
    File.write(@path, "model = \"gpt-5\"\n")
    assert @config.write(enabled: true)
    first = File.binread(@path)
    refute @config.write(enabled: true)
    assert_equal first, File.binread(@path)
    assert_includes first, "model = \"gpt-5\""
    assert_includes first, "[mcp_servers.peekaboo]"
  end

  def test_enable_disable_changes_only_managed_block
    File.write(@path, "model = \"gpt-5\"\n")
    @config.write(enabled: true)
    @config.write(enabled: false)
    assert @config.managed?(enabled: false)
    assert_equal 1, File.read(@path).scan("model = \"gpt-5\"").length
  end

  def test_refuses_unmanaged_entry
    original = "[mcp_servers.peekaboo]\ncommand = \"custom\"\n"
    File.write(@path, original)
    error = assert_raises(GhosttyAutomation::Error) { @config.write(enabled: true) }
    assert_includes error.message, "unmanaged"
    assert_equal original, File.read(@path)
  end

  def test_refuses_partial_marker
    File.write(@path, "#{GhosttyAutomation::START_MARKER}\n")
    assert_raises(GhosttyAutomation::Error) { @config.write(enabled: true) }
  end

  def test_remove_preserves_unmanaged_bytes
    original = "model = \"gpt-5\"\n"
    File.write(@path, original)
    @config.write(enabled: true)
    assert @config.remove
    assert_equal original, File.binread(@path)
  end

  def test_remove_restores_a_config_without_a_final_newline
    original = "model = \"gpt-5\""
    File.write(@path, original)
    @config.write(enabled: true)
    @config.remove
    assert_equal original, File.binread(@path)
  end
end

class GhosttyAutomationProcessTest < Minitest::Test
  def test_executable_identity_follows_a_symlinked_launch
    directory = Dir.mktmpdir("ghostty-automation-process")
    executable = File.join(directory, "peekaboo")
    File.symlink("/bin/sleep", executable)
    pid = Process.spawn(executable, "10")
    cli = GhosttyAutomation::CLI.new

    assert_equal true, cli.send(:process_executable_matches?, pid, File.realpath(executable))
    assert_equal false, cli.send(:process_executable_matches?, pid, "/usr/bin/false")
  ensure
    begin
      Process.kill("TERM", pid) if pid
      Process.wait(pid) if pid
    rescue Errno::ESRCH, Errno::ECHILD
      nil
    end
    FileUtils.remove_entry_secure(directory) if directory && File.exist?(directory)
  end
end
