# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.75.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.75.1/xcsh-darwin-x64.zip"
      sha256 "ee34b1c52baa86a2120ba86330cb27ea6ce05ca05d27b42f7a83cf73658cc2bf"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.75.1/xcsh-darwin-arm64.zip"
      sha256 "fc16b0d60cbeb994e7baee1d9e504201198bf1f01bf5b8c1b9bf8733ba640ab1"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.75.1/xcsh-linux-x64.tar.gz"
      sha256 "78954b016e614c43f3bfb9494a96a4b51c3896f14b85bd2c33a67b49eb72c2df"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.75.1/xcsh-linux-arm64.tar.gz"
      sha256 "612105f6031e9566e9d95b3c352a2d69345feb7c6020ff2c3c030974ac2d93ca"

      def install
        bin.install "xcsh"
      end
    end
  end
end
