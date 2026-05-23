# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.77.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.1/xcsh-darwin-x64.zip"
      sha256 "ba4179a1ab737b7f331af107e9681c5d3b0b70597537b55af46e75516ceae9b3"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.1/xcsh-darwin-arm64.zip"
      sha256 "8b12a556a7bc512690ce51da0a31d7474962fa175430121efe11bf2c388130a3"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.1/xcsh-linux-x64.tar.gz"
      sha256 "8e2a4cc429de737ac05b6ced57307a754c6034d41fa992da6cb2e5c28bac455f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.1/xcsh-linux-arm64.tar.gz"
      sha256 "0b90f19fdf83b3dcc0a7e577abab8528c811c0b6aa4b187fb53546a3178c19b8"

      def install
        bin.install "xcsh"
      end
    end
  end
end
