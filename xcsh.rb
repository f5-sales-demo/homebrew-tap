# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.35.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.35.2/xcsh-darwin-x64.zip"
      sha256 "42706259e45daa4fd546ae871efdfcd627c5b38d6aec1678af3599c25add4e35"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.35.2/xcsh-darwin-arm64.zip"
      sha256 "1748f291fa65adedb8f95511de41dcb4208bac0db40871541d6a8bfb960dd4f7"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.35.2/xcsh-linux-x64.tar.gz"
      sha256 "64883643a9694988edbe4a76096069f1bf64b5d589a0d54b79370633324d9cc2"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.35.2/xcsh-linux-arm64.tar.gz"
      sha256 "db91ebf17b5a0d742c20d492d3128e6bafc91c8873ac977b2f2beaa5f6ca210a"

      def install
        bin.install "xcsh"
      end
    end
  end
end
