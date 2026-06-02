# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.91.4"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.91.4/xcsh-darwin-x64.zip"
      sha256 "803ffdd5f262a5657d806e1c4e2147ffcb0603264d226ed03668c8e135d83a9c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.91.4/xcsh-darwin-arm64.zip"
      sha256 "d53d338fad9a2ff207110ba0b3895bd0ed139bc4bf9c3959bc735fdaebdead19"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.91.4/xcsh-linux-x64.tar.gz"
      sha256 "7935b71ae0986a049080c29b9149139d8a806cf7a30d8768eeb2898bddd95ea7"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.91.4/xcsh-linux-arm64.tar.gz"
      sha256 "0b99a5c940ddd67ebe1867a4b872ae957f5ba7ff3e4fca87a7ef678e06ea6fe4"

      def install
        bin.install "xcsh"
      end
    end
  end
end
