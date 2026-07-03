# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.56.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.0/xcsh-darwin-x64.zip"
      sha256 "d3ee4827a5a6780b3538332620b4f31c2bde5d234e3a017333ef79b71b34b749"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.0/xcsh-darwin-arm64.zip"
      sha256 "6e09350db206d589e97ab8bd0e3f5491f2779ea1f76297936af3e125e715511a"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.0/xcsh-linux-x64.tar.gz"
      sha256 "de387b0914b3ea4b68273189718c9936c4983e7c8a93bcf858aed640ac391ff6"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.0/xcsh-linux-arm64.tar.gz"
      sha256 "14e0d0c2c57c2387b6c9d4f4e8374b08ff0f0c3437661ec7403184b6cfaab525"

      def install
        bin.install "xcsh"
      end
    end
  end
end
