# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.15.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.15.2/xcsh-darwin-x64.zip"
      sha256 "263eede0df53b2f9f9dcf5ec010ce6e459ea718d5d7e1474adb2fe422daf4862"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.15.2/xcsh-darwin-arm64.zip"
      sha256 "639a4d89598c0e663a8d4c77338f9cdf06c410da316c47c64fa95abe8562fc39"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.15.2/xcsh-linux-x64.tar.gz"
      sha256 "b2ce0ae8da8a9e62b6cec2973318331839726bfc1f9a44d4b16379d3df2708de"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.15.2/xcsh-linux-arm64.tar.gz"
      sha256 "78587caf3d0d8a862e73d1964987706f844d03b500d22c0b60cf2b39c824aaa8"

      def install
        bin.install "xcsh"
      end
    end
  end
end
