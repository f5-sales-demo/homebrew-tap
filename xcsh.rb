# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.16.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.16.2/xcsh-darwin-x64.zip"
      sha256 "5dcdae2c62c2621815a9cf5bab28ed0f051c3da4d45e06dc8c88662cdc587a28"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.16.2/xcsh-darwin-arm64.zip"
      sha256 "089506c654943647f9adad648c797c15a41aec036f3f762290a2926514e4d10f"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.16.2/xcsh-linux-x64.tar.gz"
      sha256 "b00e1146b79f246e2de683292af4f7fc11d021e79c2009cd8d87b34f4a0ce783"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.16.2/xcsh-linux-arm64.tar.gz"
      sha256 "f19768184140b2058397f89c86c1ab68f5bbe93e02246ccd7fea81a9565750bb"

      def install
        bin.install "xcsh"
      end
    end
  end
end
