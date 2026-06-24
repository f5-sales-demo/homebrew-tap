# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.42.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.42.1/xcsh-darwin-x64.zip"
      sha256 "c26040138683b2aaa90e81815b48de5496d55ac940096651a3c5363f989c491f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.42.1/xcsh-darwin-arm64.zip"
      sha256 "aaccd74c3a38bb364675a51073e2029d56ea6207c648f0fe87dac127351d1b61"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.42.1/xcsh-linux-x64.tar.gz"
      sha256 "6b5dd61499562b27c8e1be6b27f99345db76f0dd9685f910354f5fa9fdf8cd3b"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.42.1/xcsh-linux-arm64.tar.gz"
      sha256 "fc09c9517fef59a4ca273162a2e67d48e9ccf139baec68d01c99ec1a03d9a789"

      def install
        bin.install "xcsh"
      end
    end
  end
end
