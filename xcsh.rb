# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.58.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.1/xcsh-darwin-x64.zip"
      sha256 "a4b6774cbdb24d0f74d927f369233ed40f3d334bc8dc640fba4f27bd8ea950f6"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.1/xcsh-darwin-arm64.zip"
      sha256 "731ad5c25802f91db7c1f5e6d6deb65e9747c19b4f39ac6748b1beb36dc09dd4"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.1/xcsh-linux-x64.tar.gz"
      sha256 "196884b2ca77213b4278df84d1c14d9f571ea152cd493d8e2e1037aa09ab81c8"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.1/xcsh-linux-arm64.tar.gz"
      sha256 "67f6b809f4a76de94d203a466b9bc2d9e2631a410d5c843a4cd5b85e428ab8f8"

      def install
        bin.install "xcsh"
      end
    end
  end
end
