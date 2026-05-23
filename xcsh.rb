# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.76.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.76.1/xcsh-darwin-x64.zip"
      sha256 "f0e82de3ed53b6ab551fee8571586237069004d0adbc72732443d083a836c9ba"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.76.1/xcsh-darwin-arm64.zip"
      sha256 "7b1bdaf4f7d9a2d4e90299a71a07aa57acedea0b7e896203c0188e5b10c21c15"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.76.1/xcsh-linux-x64.tar.gz"
      sha256 "a38ae61e4889357ab8935c7352ac2283a66194563af54a1547977e981d2e6681"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.76.1/xcsh-linux-arm64.tar.gz"
      sha256 "36053fa5d13e17d4ca56cb51cd8c4a082e6a8a3cffdf0acd8db335d17df8f3f9"

      def install
        bin.install "xcsh"
      end
    end
  end
end
