# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.61.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.0/xcsh-darwin-x64.zip"
      sha256 "ce7e0eeec9c701cdcb7ac988da27c844f1f61f5cbc16f819183d425dc98c77d4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.0/xcsh-darwin-arm64.zip"
      sha256 "52b8d4242ad7a6e25ccff779ac08baf49f17542781ff8cb39b768d68a4987ad4"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.0/xcsh-linux-x64.tar.gz"
      sha256 "becebbaa2cc3e48ec9964773cfac773383f22f226a93b18740a80e56fd4c0ac3"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.0/xcsh-linux-arm64.tar.gz"
      sha256 "cfa3e2a308bb2437e9cd4e736f294e84bcf435a9814b96107b84f38ab4a3d3e6"

      def install
        bin.install "xcsh"
      end
    end
  end
end
