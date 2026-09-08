# typed: strict
# frozen_string_literal: true

class Peekaboo < Formula
  desc "Secure macOS UI automation CLI"
  homepage "https://github.com/openclaw/Peekaboo"
  url "https://github.com/openclaw/Peekaboo/releases/download/v4.3.2/peekaboo-macos-universal.tar.gz"
  version "4.3.2"
  sha256 "a7f706a1847e9e8513fd6f2f0a8f02cbdafe8f07d2a2ca028f2213b06f185e08"
  license "MIT"

  depends_on :macos

  def install
    libexec.install "peekaboo", "libswiftCompatibilitySpan.dylib", "LICENSE", "README.md", "VERSION"
    bin.install_symlink libexec/"peekaboo"
  end

  def caveats
    <<~EOS
      Peekaboo needs explicit macOS privacy consent for Screen Recording and
      Accessibility. Foreground synthetic input also needs Event Synthesizing.
      Install the signed companion app with:

        brew install --cask f5-sales-demo/tap/peekaboo-app
    EOS
  end

  test do
    assert_match "Peekaboo #{version}", shell_output("#{bin}/peekaboo --version")
  end
end
