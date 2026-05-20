# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.73.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.73.0/xcsh-darwin-x64.zip"
      sha256 "cb2ed014d8c91e41cfe895e249116a5631906cca35e87eedeaff850a639bb6e1"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.73.0/xcsh-darwin-arm64.zip"
      sha256 "e31b8146b4d67c13c1b85f06574a08998807e0c3671bd23f6dec9e51cf12711b"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.73.0/xcsh-linux-x64.tar.gz"
      sha256 "0065acf711f38b3255ce417c3562532d243aa43bb4f4609c52902521b6960dbf"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.73.0/xcsh-linux-arm64.tar.gz"
      sha256 "863925b3186f51852abb44ae13cc13831b8596391b42c9c482a2d74009205d3a"

      def install
        bin.install "xcsh"
      end
    end
  end
end
