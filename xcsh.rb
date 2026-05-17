# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.66.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.66.0/xcsh-darwin-x64.zip"
      sha256 "6ced43e0258d9018f782c12d494bf3131028bbfd04aeb7a790b9096f5585c31b"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.66.0/xcsh-darwin-arm64.zip"
      sha256 "c0dfc33b64b6449e940f32608930b1345b77f116c814d8f86e2fbb9c7ebef225"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.66.0/xcsh-linux-x64.tar.gz"
      sha256 "d2336fcdbd157944c3d66a8ec27cd7dafb507f6a6942644a17182a01f06b907e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.66.0/xcsh-linux-arm64.tar.gz"
      sha256 "8644d9b2ef1caec8469e61fe6ee752c83a1fef2f06bda73f34564ce56804a251"

      def install
        bin.install "xcsh"
      end
    end
  end
end
