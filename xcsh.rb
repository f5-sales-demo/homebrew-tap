# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.57.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.0/xcsh-darwin-x64.zip"
      sha256 "dd508d6a9690518248cda1d7630a6613d3976cdb271f50e161abe3f663003abb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.0/xcsh-darwin-arm64.zip"
      sha256 "4678cb77891239db94ba9e25b7de98ba0a36c47f7c1a3207e08df84f9eb3723c"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.0/xcsh-linux-x64.tar.gz"
      sha256 "2c4ae044c4c3358c6eadeb310dc353bb19d713f94664e96745ab60a3bc3f80bd"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.0/xcsh-linux-arm64.tar.gz"
      sha256 "cd88ba57b701522f0db70885e9a627ac47d023ca2bff66ef87ceacb58d4fd1c0"

      def install
        bin.install "xcsh"
      end
    end
  end
end
