# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.39.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.39.0/xcsh-darwin-x64.zip"
      sha256 "7ad265f1b237a52a7c088396380852af15cf20c9d00849d36123ad560b1b42e6"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.39.0/xcsh-darwin-arm64.zip"
      sha256 "60a72b804f52035a13081389c8cacdd822aabc9fd5f5b9dfd2c243c092468036"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.39.0/xcsh-linux-x64.tar.gz"
      sha256 "e21d03d7d4b91b66a511c7a3d591b67a40e061c07a933f87fda9e2c7d18dc083"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.39.0/xcsh-linux-arm64.tar.gz"
      sha256 "ac829c43391b7bedb264230e10d49e4e7369c2a9d1c70f0d903724b9d34a39f6"

      def install
        bin.install "xcsh"
      end
    end
  end
end
