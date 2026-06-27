# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.51.5"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.5/xcsh-darwin-x64.zip"
      sha256 "ae91bd179137caef88429a8f02b1c4bf8d6691c4316d686913b33da35a7f4205"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.5/xcsh-darwin-arm64.zip"
      sha256 "0d8876a26e7e6cf8cef5a31aec9dd1f849d593cb88834abf34990c5fcef375c0"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.5/xcsh-linux-x64.tar.gz"
      sha256 "0252abf319d727a60d234365fe17c2ab6d96c23c93fb588e30f0a3b214945182"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.51.5/xcsh-linux-arm64.tar.gz"
      sha256 "f3c8194361b0b339ae0118ae6865a16e0f5a6ee1d7e8b77c9760c7a1ec35e698"

      def install
        bin.install "xcsh"
      end
    end
  end
end
