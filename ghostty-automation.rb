class GhosttyAutomation < Formula
  desc "Guarded Peekaboo MCP setup and acceptance tooling for Ghostty"
  homepage "https://github.com/f5-sales-demo/homebrew-tap/blob/main/docs/ghostty-automation.md"
  url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/18cf0f55bebfcaa3e4ebfdb5f13ccb1908b787f1/bin/ghostty-automation",
      using: :nounzip
  version "1.0.0"
  sha256 "f33580ec7838fbad74ff55bb8f123483e92d97660962cbfe70499b3d25215f6d"
  license "MIT"

  depends_on "peekaboo"
  depends_on :macos

  resource "peekaboo-mcp-proxy" do
    url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/4bbef90148419a1bdc3a9f22f7ee7701ba1c6cf3/libexec/peekaboo-mcp-proxy",
        using: :nounzip
    sha256 "76fb530252c01d25fa412c7b3e86f8ee381a820350c8c335fad24c90d65dc8f2"
  end

  resource "mcp-contract" do
    url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/18cf0f55bebfcaa3e4ebfdb5f13ccb1908b787f1/libexec/peekaboo-mcp-contract-4.3.2.json",
        using: :nounzip
    sha256 "b3d32a9aa1c8a30410469a2f93b1cb8c9030381317db9caf383d2caee7ce7f21"
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
