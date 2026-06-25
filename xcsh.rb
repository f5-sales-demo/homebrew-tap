# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.48.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.48.0/xcsh-darwin-x64.zip"
      sha256 "af81005d350b1a6ed14f8b1b43f8d1d8b99315f04984a6ff5334dc968a33130d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.48.0/xcsh-darwin-arm64.zip"
      sha256 "13843c92e20f9fc280da6a1df5141dd51ce6238e846ff3d27829528880c84658"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.48.0/xcsh-linux-x64.tar.gz"
      sha256 "807f87d73b5e92ee0cfe8fd708c60afd1621f0a64b4101060abf8af1ee54d645"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.48.0/xcsh-linux-arm64.tar.gz"
      sha256 "1b1ca5227af017ee05de59a66d4631e7bb498dfb2de020403dae329513c6a94e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
