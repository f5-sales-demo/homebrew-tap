# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.19.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.19.0/xcsh-darwin-x64.zip"
      sha256 "3c449ed226d0c02245be45244c8ee4b84f7f2b0b20eee225e8f31607a284e6df"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.19.0/xcsh-darwin-arm64.zip"
      sha256 "cce9a9c54d9435c80297bf1df6a91158539c4803802fb784593c60ee8c82e436"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.19.0/xcsh-linux-x64.tar.gz"
      sha256 "4f527ff7477668000a2ea818781bba52639b87776da029ab1de9c4e5b3890d79"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.19.0/xcsh-linux-arm64.tar.gz"
      sha256 "1cf0c655abc46ae5056b89db27daea5200a7c27aeadfca38e92a75ed0631657e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
