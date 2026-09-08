# typed: strict
# frozen_string_literal: true

# Installs the guarded Ghostty and Peekaboo automation management utility.
class GhosttyAutomation < Formula
  desc "Guarded Peekaboo MCP setup and acceptance tooling for Ghostty"
  homepage "https://github.com/f5-sales-demo/homebrew-tap/blob/main/docs/ghostty-automation.md"
  url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/92b0b5e93419cbc57ebf60b6058468058978d4ca/bin/ghostty-automation",
      using: :nounzip
  version "1.0.1"
  sha256 "56176fc501eae92587bd03fa2f6918eb950003952da635e96a25688f25761656"
  license "MIT"

  depends_on :macos
  depends_on "peekaboo"

  resource "peekaboo-mcp-proxy" do
    url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/6d2229448c2fe09b7a35e50e5433ced29b4fa122/libexec/peekaboo-mcp-proxy",
        using: :nounzip
    sha256 "1069cdc32b395e9171c08f6197f47f19ff11c157a7fd6602604378ad04d986ef"
  end

  resource "mcp-contract" do
    url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/1bd0bf0d385a8820f63ab5fdf8e8520a6ec19968/libexec/peekaboo-mcp-contract-4.3.2.json",
        using: :nounzip
    sha256 "75471c1b370f8323cfbc098c7599d9f1a5b18910ee53a09cc76dcffd259edd22"
  end

  resource "documentation" do
    url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/92b0b5e93419cbc57ebf60b6058468058978d4ca/docs/ghostty-automation.md",
        using: :nounzip
    sha256 "31f057fe1f4da8d6240fece1e6e2bd33501289f2ec23f2b9b07d54d33d0cbd49"
  end

  def install
    bin.install "ghostty-automation"
    resource("peekaboo-mcp-proxy").stage do
      libexec.install "peekaboo-mcp-proxy"
    end
    resource("mcp-contract").stage do
      pkgshare.install "peekaboo-mcp-contract-4.3.2.json"
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
