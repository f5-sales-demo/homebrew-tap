# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.57.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.2/xcsh-darwin-x64.zip"
      sha256 "be375f8effa158bfed9c8fcd50551f1b4cf2e63b839a9a4224db8c2285c08f48"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.2/xcsh-darwin-arm64.zip"
      sha256 "d861e6de30e012e6ad37db7eb92659044f7fbdfa8fedc8db4fb0a1fef1433b9e"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.2/xcsh-linux-x64.tar.gz"
      sha256 "e232eb6ffa166a6a6621f1a32811e8d630c20bef227c74f3691c126fd391c58e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.57.2/xcsh-linux-arm64.tar.gz"
      sha256 "c5622aa7966332f938a8b175e88a1bd0091b3df7f558271ba80ac36b9f20e9c4"

      def install
        bin.install "xcsh"
      end
    end
  end
end
