# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.81.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.81.0/xcsh-darwin-x64.zip"
      sha256 "e8e372d33090e2bcc6e0027fb23c140e8b229e1bc93362e10000b5e18222ab01"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.81.0/xcsh-darwin-arm64.zip"
      sha256 "f6318054d093fa2c21410e846390b7c1d157f4aaa9c3635e4c4fc4806959b493"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.81.0/xcsh-linux-x64.tar.gz"
      sha256 "8a774f3717ace8a8f0ad1345114fbda0a965e54a8b81002924aaf52e2cb3967f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.81.0/xcsh-linux-arm64.tar.gz"
      sha256 "9377e1532fa4cae6e6f516214027f4423314b390e749812409e59d9a2c138d80"

      def install
        bin.install "xcsh"
      end
    end
  end
end
