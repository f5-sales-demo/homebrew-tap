# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.60.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.60.0/xcsh-darwin-x64.zip"
      sha256 "772bf498f113d7a2cc7e873b33ad14de5a6c917d017824a19cf4a958826ba2de"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.60.0/xcsh-darwin-arm64.zip"
      sha256 "d698fc2e1358031947604b709838cd6653018146f4574f9927251f22c3edbf93"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.60.0/xcsh-linux-x64.tar.gz"
      sha256 "e92fd85abbdbb6206e1d451458823933c766579d8b3c0609e50152892824c327"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.60.0/xcsh-linux-arm64.tar.gz"
      sha256 "71333a529d73cc31c3d07dabd06881521c32ad0d52f6bb75db67a4c0d0c5221e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
