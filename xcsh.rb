# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.43.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.43.1/xcsh-darwin-x64.zip"
      sha256 "d1746f2b4c319165ae9dd102cea0650d3fd1f2742959216e84ff3fbc980bd02d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.43.1/xcsh-darwin-arm64.zip"
      sha256 "6598106abf799055d8853c9226456315469e898817223095eda2c7adcb84b1e9"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.43.1/xcsh-linux-x64.tar.gz"
      sha256 "73e9f5ab438c79dec1f52c38518197098d92e702d4223ef9144f2226d8a4d44e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.43.1/xcsh-linux-arm64.tar.gz"
      sha256 "dfe0a494f877a96912573d5ca14ce323b99d456c38d9122d278b5a6b85459b6c"

      def install
        bin.install "xcsh"
      end
    end
  end
end
