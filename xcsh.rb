# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.17.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.17.0/xcsh-darwin-x64.zip"
      sha256 "48440e1055ec590d75d5acaa242363c1c2835b9721f1b1f8a31d8729711b35bc"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.17.0/xcsh-darwin-arm64.zip"
      sha256 "0aed080b5272bb94a0c72022b8c80a75c085a05d871eb5f36e502f632b21c9c6"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.17.0/xcsh-linux-x64.tar.gz"
      sha256 "62d7df3abf0f68d0f7b2b13fd9d2aa9d8e350c9c24e5de609c39728602e1ff35"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.17.0/xcsh-linux-arm64.tar.gz"
      sha256 "09e2f8e3d25b349c7e92dbfa950d8ba414622fbb5707ab3d83ab0dc7a2068fa6"

      def install
        bin.install "xcsh"
      end
    end
  end
end
