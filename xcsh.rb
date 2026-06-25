# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.47.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.47.0/xcsh-darwin-x64.zip"
      sha256 "6160bcd0c57fe139c29cb1a2044fd5945ea2bd509d0facc7a65b8b205603e57d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.47.0/xcsh-darwin-arm64.zip"
      sha256 "f0ef6add9d4a00e3b99bff935afd67a24b9ac83131d5a40e3cf9c1a8b497ce52"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.47.0/xcsh-linux-x64.tar.gz"
      sha256 "097044aec3d88735594252e59b89425539aef992f0035ea320591d3907c5a7e4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.47.0/xcsh-linux-arm64.tar.gz"
      sha256 "a22651739d97b898483e4705519df8a65695d6ed78d8a7174a73938e2c429374"

      def install
        bin.install "xcsh"
      end
    end
  end
end
