# typed: strict
# frozen_string_literal: true

# Installs the guarded Ghostty and Peekaboo automation management utility.
class GhosttyAutomation < Formula
  desc "Guarded Peekaboo MCP setup and acceptance tooling for Ghostty"
  homepage "https://github.com/f5-sales-demo/homebrew-tap/blob/main/docs/ghostty-automation.md"
  url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/c053df2f4dac21d01a88167008d919444cb6a1f9/bin/ghostty-automation",
      using: :nounzip
  version "1.0.3"
  sha256 "9f809e3b5754b8a1350ab6ea0f6f90e7bfbbde57a7799e66147f7fc28aef4a01"
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
    url "https://raw.githubusercontent.com/f5-sales-demo/homebrew-tap/c053df2f4dac21d01a88167008d919444cb6a1f9/docs/ghostty-automation.md",
        using: :nounzip
    sha256 "0d36544e1ccd092e0e16163d504fc8bb5bb4b70d6c2791bed13e7379153b6ad8"
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
