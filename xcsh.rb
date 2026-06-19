# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.37.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.37.0/xcsh-darwin-x64.zip"
      sha256 "910f0b8c28c16458107dcecd851d5a0bd0b72192fe6b092b9fd6e2715224154e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.37.0/xcsh-darwin-arm64.zip"
      sha256 "1d7d1429fb096b6ebe704123f0fd60a474616fd8c62b2ffb9e700e4757ace2da"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.37.0/xcsh-linux-x64.tar.gz"
      sha256 "578c9c46168fb1d97cb6292be0b0fa4574d7a5229772e711a643be84cb3201f6"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.37.0/xcsh-linux-arm64.tar.gz"
      sha256 "975e6f0c377980589f964f524a55ab705f861d10b375c6d6f9dbfdef40967cc2"

      def install
        bin.install "xcsh"
      end
    end
  end
end
