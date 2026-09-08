class GhosttyAutomation < Formula
  desc "Guarded Peekaboo MCP setup and acceptance tooling for Ghostty"
  homepage "https://github.com/f5-sales-demo/homebrew-tap/blob/main/docs/ghostty-automation.md"
  url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/4ba60d6924751501e89f93eac364cc805d9c6f53/bin/ghostty-automation",
      using: :nounzip
  version "1.0.0"
  sha256 "7e5720efba858e83e71f5a549eafbcf9e10486a1676a1c5fcce7086d4e876761"
  license "MIT"

  depends_on "peekaboo"
  depends_on :macos

  resource "peekaboo-mcp-proxy" do
    url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/b68eb6d27600604c1468c979078115104903c0e9/libexec/peekaboo-mcp-proxy",
        using: :nounzip
    sha256 "e893287bca164e3b4ac1a82e03e8d15afa815114641ececdab203e483b66a151"
  end

  resource "mcp-contract" do
    url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/1bd0bf0d385a8820f63ab5fdf8e8520a6ec19968/libexec/peekaboo-mcp-contract-4.3.2.json",
        using: :nounzip
    sha256 "75471c1b370f8323cfbc098c7599d9f1a5b18910ee53a09cc76dcffd259edd22"
  end

  resource "documentation" do
    url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/4bbef90148419a1bdc3a9f22f7ee7701ba1c6cf3/docs/ghostty-automation.md",
        using: :nounzip
    sha256 "232c8183f8fc3a6aa89e3656addc85f39c97e09718c9faad1e78f136219483d2"
  end

  def install
    bin.install "ghostty-automation"
    resource("peekaboo-mcp-proxy").stage do
      libexec.install "peekaboo-mcp-proxy"
    end
    resource("mcp-contract").stage do
      (share/"ghostty-automation").install "peekaboo-mcp-contract-4.3.2.json"
    end
    resource("documentation").stage do
      doc.install "ghostty-automation.md"
    end
  end

  def caveats
    <<~EOS
      Complete interactive setup and explicit macOS privacy consent with:

        ghostty-automation setup
    EOS
  end

  test do
    assert_match "ghostty-automation #{version}", shell_output("#{bin}/ghostty-automation --version")
  end
end
