# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.51.4"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.4/xcsh-darwin-x64.zip"
      sha256 "6f90e712282a7dce464031b611d58ce4bb9568f40d5b2aa23fc78ec98096350e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.4/xcsh-darwin-arm64.zip"
      sha256 "0d92867db4726efae385609ef966b8e3566985ee24cc6a922557007c1af3172d"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.4/xcsh-linux-x64.tar.gz"
      sha256 "baafa08dc76be84cf89fcd2a1c572c02ae416a7e49ff6163ce793453a87db1db"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.4/xcsh-linux-arm64.tar.gz"
      sha256 "11e05da6a1c0ffcc7601406fb878d3e350ebd69d00fb3be0ebad547226f277ec"

      def install
        bin.install "xcsh"
      end
    end
  end
end
