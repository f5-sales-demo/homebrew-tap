# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.53.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.53.2/xcsh-darwin-x64.zip"
      sha256 "6adb723e568331391fd2cb7e7e65da3f28792f028f435a354a5d907cee3743f2"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.53.2/xcsh-darwin-arm64.zip"
      sha256 "ebfd7235eedbf2df719e2771d84aa91a9e3ff23d4b334746d9a78771845e421a"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.53.2/xcsh-linux-x64.tar.gz"
      sha256 "89317c4bfadd56be16c4c7111ed79e7111573872399f8ba2bc5dae4ab1b6c2c0"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.53.2/xcsh-linux-arm64.tar.gz"
      sha256 "125d89f4c26c3433b7bd9f5b350d9194ce41e5cbc414f498dd2db89583f44d99"

      def install
        bin.install "xcsh"
      end
    end
  end
end
