# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.36.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.36.0/xcsh-darwin-x64.zip"
      sha256 "56a439e4a8fe61dd30fc10d98042377ae28f7d926f42a85d86a5ca8764264b4a"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.36.0/xcsh-darwin-arm64.zip"
      sha256 "c4b645d1869a1fcf782631234cb0ae7aba89643504c93353726db7a90aa6b354"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.36.0/xcsh-linux-x64.tar.gz"
      sha256 "7719a399655d84b96fdcdc20809c338895aaff7331b13abd1ac5339bb8ca222c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.36.0/xcsh-linux-arm64.tar.gz"
      sha256 "c183bb74c42ee349f11fa11be1f5722064f6d78a7df246b1e3fc82b25573d715"

      def install
        bin.install "xcsh"
      end
    end
  end
end
