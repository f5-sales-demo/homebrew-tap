# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.29.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.2/xcsh-darwin-x64.zip"
      sha256 "2f8006cc9f02fabdbbadcde8ebecd9063903788dea1a742cb2a500bc127a0f55"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.2/xcsh-darwin-arm64.zip"
      sha256 "fe5f787c325a7367abf546bbdb83f6c5da24d5a6e32197e5b928e705a3722b79"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.2/xcsh-linux-x64.tar.gz"
      sha256 "1d9e1d4932992be9ca030975650b793e9947b0484d4b48f1431801080003efeb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.2/xcsh-linux-arm64.tar.gz"
      sha256 "ae9d5d3001a4b3a341b76659c9cef30dcb1ce3c8d675ba3d7597d3c1456e6d1c"

      def install
        bin.install "xcsh"
      end
    end
  end
end
