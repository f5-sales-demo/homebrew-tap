# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.51.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.2/xcsh-darwin-x64.zip"
      sha256 "d4d4889506b8e63e6b233941aae1ae66a98dddb636ae554bacc136dd93e757e9"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.2/xcsh-darwin-arm64.zip"
      sha256 "ce61ee848ecf1d18eab4c40476bcf0550b5cf5fbaf45af816531ac39e3ccb7c8"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.2/xcsh-linux-x64.tar.gz"
      sha256 "c29e882400c2de825cbca2539f1cb7f1d3945d606c994c9d46f2765507de7a90"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.2/xcsh-linux-arm64.tar.gz"
      sha256 "d29283825b18adb9afec99029d10b120bfee18864c8c9347f703002095ca8fd3"

      def install
        bin.install "xcsh"
      end
    end
  end
end
