# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.3.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.3.0/xcsh-darwin-x64.zip"
      sha256 "9f2b5a82d02770067b587671b8b5848e11e57a59f108571f1c8edb76cd58ca3d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.3.0/xcsh-darwin-arm64.zip"
      sha256 "df88af211d3e7a7f50d6f7a80fbade4c5ecc4806b6a46107f5e50b8900ef94c5"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.3.0/xcsh-linux-x64.tar.gz"
      sha256 "2602df73c208ab4caf5a51fc17f33549f05c7466d78c24b8a0ba70fb33905b4f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.3.0/xcsh-linux-arm64.tar.gz"
      sha256 "1ae9e4a23d64b73471974172d2f0d5718a197aaba6c399ecb5d3854d9c091673"

      def install
        bin.install "xcsh"
      end
    end
  end
end
