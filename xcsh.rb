# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.25.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.25.0/xcsh-darwin-x64.zip"
      sha256 "3302c7e085b1393a5e39158cc3629c004ccb2b67fe2db52ed7508145297cc945"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.25.0/xcsh-darwin-arm64.zip"
      sha256 "cec9cca863d4ef0e0ca518a021b1d309cded80cd8f3d4d37131c040fe50a3196"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.25.0/xcsh-linux-x64.tar.gz"
      sha256 "679536572ffa612731b820e5cc614114c9ce77274858949fece132f819102165"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.25.0/xcsh-linux-arm64.tar.gz"
      sha256 "6f41a9c690a3942b5afa45a2f09e5db6dd6542db01a06163f23dc0c1715716bb"

      def install
        bin.install "xcsh"
      end
    end
  end
end
