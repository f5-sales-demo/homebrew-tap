# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.74.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.1/xcsh-darwin-x64.zip"
      sha256 "4f887e35353fae425bba17d9f7cf6e8467d058b5a39e65b0475466fe09ea3ae4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.1/xcsh-darwin-arm64.zip"
      sha256 "dfcbf129a06b54df219108ad604272553d182e9523b3448d3125343cc1afb305"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.1/xcsh-linux-x64.tar.gz"
      sha256 "c94841720c9adcdb670a73d9424a9370c060a68dc1cb543bed2a89ac31657b7a"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.1/xcsh-linux-arm64.tar.gz"
      sha256 "7c6cf9496f8d9d746d297c1ff0739a568b92c03619496fe043ee47798e6527fd"

      def install
        bin.install "xcsh"
      end
    end
  end
end
