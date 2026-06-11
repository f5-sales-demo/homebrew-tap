# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.27.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.27.0/xcsh-darwin-x64.zip"
      sha256 "283330ff0e0ad056ca9fa6ad1907a28ac6c1a005ef282a8f1efc2ad7c595779a"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.27.0/xcsh-darwin-arm64.zip"
      sha256 "504f632533a2502c7d3ef670293edeadb0edea5135203753180b046e8631e174"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.27.0/xcsh-linux-x64.tar.gz"
      sha256 "491d796e4626006e9f5107996847279caf1f6bb23885f38f0f79046a066db4db"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.27.0/xcsh-linux-arm64.tar.gz"
      sha256 "1d23aea137394337a74b1a3df234a8794ab9d2a6fdc5691ce99332c579d9f0b6"

      def install
        bin.install "xcsh"
      end
    end
  end
end
