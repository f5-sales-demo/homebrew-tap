# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.61.4"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.4/xcsh-darwin-x64.zip"
      sha256 "948064be951290cbd12e1f69a954149bab50028ef33979510429bb0e7624e96f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.4/xcsh-darwin-arm64.zip"
      sha256 "7a97068759fd988ca991f70feb23889ac35630ebd447cc2018ec7885cd385d61"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.4/xcsh-linux-x64.tar.gz"
      sha256 "b77a385c60569c30e1cb20862f2e53071053d8a09d4ed83b677da885646ac3b4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.4/xcsh-linux-arm64.tar.gz"
      sha256 "00181de65be6ed547c10cac5e8b216b8063855d0b13d1119182c0784162cee8e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
