# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.57.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.1/xcsh-darwin-x64.zip"
      sha256 "cd58fc139ac29070b944b93b8b1c7994d0e33fc934ae514f6ab1864fe3e762fe"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.1/xcsh-darwin-arm64.zip"
      sha256 "65d1af589b96b35ce2994d9e8740b8d7eb83fc59beba5fa4bf075ce2c619e638"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.1/xcsh-linux-x64.tar.gz"
      sha256 "4a77a48bed8191a6d33e122222c134e7a421aa09c1119e6e8088ee54550d77b2"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.1/xcsh-linux-arm64.tar.gz"
      sha256 "10c32fb54dc464d40ec9486f9ba5dd7586c50e54dce4269a5c4c9a15650111eb"

      def install
        bin.install "xcsh"
      end
    end
  end
end
