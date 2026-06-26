# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.49.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.49.0/xcsh-darwin-x64.zip"
      sha256 "8e3b18d4d3b19974e3197755bb48888b4d32f924f932c18fa44b3e77bf50daba"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.49.0/xcsh-darwin-arm64.zip"
      sha256 "3a4ff2280c265a30f6492c02f83d1d2194dfea2008e806cba917b5dec305c7c9"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.49.0/xcsh-linux-x64.tar.gz"
      sha256 "96919b1587136d58440f77332cfb14534c40c8524d0de3ece80cece38ac846bf"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.49.0/xcsh-linux-arm64.tar.gz"
      sha256 "64e5dfd054c24843c6a2e9ff106b07bfb58134d675451f5a6c57412ebea34199"

      def install
        bin.install "xcsh"
      end
    end
  end
end
