# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.16.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.16.1/xcsh-darwin-x64.zip"
      sha256 "c28fda4cb65da856c84dc3bf543e2454f6ae703baf168dd619bcd13396d6fbc9"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.16.1/xcsh-darwin-arm64.zip"
      sha256 "c387d51470acad2fcf6ab463cd32926057a0baa73628505a36551f1f5f8b8c61"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.16.1/xcsh-linux-x64.tar.gz"
      sha256 "46e2fb62e9efb08caa370ba6a08ecc80e83e927c5530163301f8a3706b93a99e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.16.1/xcsh-linux-arm64.tar.gz"
      sha256 "06170ad5ba6ad7f2b6dd4e04a4c3271f59cf2d96efd5937319ac29925ba6cf91"

      def install
        bin.install "xcsh"
      end
    end
  end
end
