# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.77.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.0/xcsh-darwin-x64.zip"
      sha256 "2a27bd5846d594cd2f359765722acd02618075b448bd3711e0c5ed0e7a14c72e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.0/xcsh-darwin-arm64.zip"
      sha256 "601506e1a15ce216f95500a1c60d4e400f9d55284c9e5d5f23a4941e17efa362"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.0/xcsh-linux-x64.tar.gz"
      sha256 "5d4d7731e01363dbb2876f71ace437b8c3856746ed536b78f25296190727451a"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.77.0/xcsh-linux-arm64.tar.gz"
      sha256 "4d415e7371f14a18171706d2b3e18f6d31605a79e38a76492de3164473c1af27"

      def install
        bin.install "xcsh"
      end
    end
  end
end
