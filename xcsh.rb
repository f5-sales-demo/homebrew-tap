# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.11.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.11.0/xcsh-darwin-x64.zip"
      sha256 "09b3b22fad7a2b17d1627fc52ba3c5d38099468edfc6c2ae80039cd98f90700e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.11.0/xcsh-darwin-arm64.zip"
      sha256 "7aee29004d05b10b89561dd346f8e82ddf3a99b8551016d3eb068707915c45f0"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.11.0/xcsh-linux-x64.tar.gz"
      sha256 "443665e24a82d297ebe4d58553b1178f12903e8778f7e72fa0f06c3d801e6eaf"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.11.0/xcsh-linux-arm64.tar.gz"
      sha256 "e6f7d0552917a52e60e398c25f2fa7f302659b3471fade8f00286834dd4bbab4"

      def install
        bin.install "xcsh"
      end
    end
  end
end
