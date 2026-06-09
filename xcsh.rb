# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.20.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.20.1/xcsh-darwin-x64.zip"
      sha256 "796f1843e3c66c9f7641f6f65cdfdb01cdf16e14a56c92fa42fdbcf0bc03156d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.20.1/xcsh-darwin-arm64.zip"
      sha256 "ed8802bc72fe8c37f6a0fa1ebf7915c836a9a011f25fe01fe3b384efc9f0415c"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.20.1/xcsh-linux-x64.tar.gz"
      sha256 "91ff765ecec018ae66edebd63fa7ef5c387569190f1f52f07b7bba4f70f88400"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.20.1/xcsh-linux-arm64.tar.gz"
      sha256 "2139512845883fdb7d5f4ca9e0de61fd8913db1649b3ec50483d6a5de8d0827e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
