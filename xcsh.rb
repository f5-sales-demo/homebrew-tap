# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.77.5"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.5/xcsh-darwin-x64.zip"
      sha256 "b4dd2d23de5b7381eb3bb5895eacf077c59fed3729cd2eeb7098539a003dda84"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.5/xcsh-darwin-arm64.zip"
      sha256 "3a5dc64919cc3616f6935f448b7371553a82c170ce2d1c8f8c8d316397bde711"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.5/xcsh-linux-x64.tar.gz"
      sha256 "c6371ff0e9d25ed64a2c6070b7286e2620bd659965cbe0c2b01b2eafbe43952f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.5/xcsh-linux-arm64.tar.gz"
      sha256 "00af0bc6e92819a6f2def3b0c1645cd109fc4e3c43b2dd35d45e790bd2d52e8d"

      def install
        bin.install "xcsh"
      end
    end
  end
end
