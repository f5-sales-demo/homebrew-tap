# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.82.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.82.0/xcsh-darwin-x64.zip"
      sha256 "f15dd060f8e6c64cb811968d1062e512a73775c148f81f83bd003d6211cd4ade"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.82.0/xcsh-darwin-arm64.zip"
      sha256 "58275c614e588718885f337a27c8c00cb364c12e4c5dc4b1d76ba5eeb21577d2"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.82.0/xcsh-linux-x64.tar.gz"
      sha256 "66d3c6a4b421dea61d1251b2b02c1f3e54f09b110021dd0ffd97442308476c31"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.82.0/xcsh-linux-arm64.tar.gz"
      sha256 "ac76a98c0ad18191b698cb2ec9602b1ee4163713c014f4be22b021204f01e334"

      def install
        bin.install "xcsh"
      end
    end
  end
end
