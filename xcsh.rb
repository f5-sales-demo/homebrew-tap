# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.58.3"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.3/xcsh-darwin-x64.zip"
      sha256 "92b6809e02add52abfff5e19434f2b225f52c1a3a20cea30b29a2c5c91e4c8fb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.3/xcsh-darwin-arm64.zip"
      sha256 "7ef23b82ca7dc9f3246bbcb1d71736b8c49974bae2a31d092bb5bfe013c61ef4"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.3/xcsh-linux-x64.tar.gz"
      sha256 "aaff8c85f8d5dc1f6ad6e7431d1f0ea3c514a1bdd2a267bc53951840d3a5c781"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.3/xcsh-linux-arm64.tar.gz"
      sha256 "6183683d6a8754189153ad2bf8faaa9ed7c18c57c7cecd53cd0982bbacaf12c5"

      def install
        bin.install "xcsh"
      end
    end
  end
end
