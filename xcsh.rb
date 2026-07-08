# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.62.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.0/xcsh-darwin-x64.zip"
      sha256 "13ddc5d555191d0642b0f617abcfed45df9f4a835432a99abe5eae10905cde1d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.0/xcsh-darwin-arm64.zip"
      sha256 "1fa7a6861384a22427e223cd155f4893e2e69c396390a26d4d0bb1316f8c9da6"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.0/xcsh-linux-x64.tar.gz"
      sha256 "b968df6776328bf317af627e62ddfabdbf5d4db25e3e6cde43ffcf833daa66b5"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.0/xcsh-linux-arm64.tar.gz"
      sha256 "0051aa60c21b20800003fd29041a7643cb21ba18ff78d2d459bfd95fe5ce0a64"

      def install
        bin.install "xcsh"
      end
    end
  end
end
