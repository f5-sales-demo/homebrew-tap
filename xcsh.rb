# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.53.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.53.1/xcsh-darwin-x64.zip"
      sha256 "1547c387bc345dbd272b1404fda53e7a33c376481017c301cf126f2c5c0b25e0"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.53.1/xcsh-darwin-arm64.zip"
      sha256 "c4d0184d58a077efe091a73d37da2d99a94db4b3d759301d0e7fbc560981857e"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.53.1/xcsh-linux-x64.tar.gz"
      sha256 "67c4e1e74fd24de00d32d8db0f42f3c7efac3c5e34a8e259c2cf2e5c3cac3eeb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.53.1/xcsh-linux-arm64.tar.gz"
      sha256 "a7ce52160aa8cf1f465d872087489728c42f506a3c347a66c87d0d9022ed4b1a"

      def install
        bin.install "xcsh"
      end
    end
  end
end
