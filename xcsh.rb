# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.35.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.35.1/xcsh-darwin-x64.zip"
      sha256 "1f76f84480d90089c906850e3ad5d38dd9707a22586d30ed02e158b9d4917f0c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.35.1/xcsh-darwin-arm64.zip"
      sha256 "f5ed0ac79eabe67a4fb251a5e3670e00da2aaccec71a099a4cded9558e01960d"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.35.1/xcsh-linux-x64.tar.gz"
      sha256 "23a36c1e555d420f853e83695ecab2b02476f6c76a0bac9fb05db6606afae6d0"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.35.1/xcsh-linux-arm64.tar.gz"
      sha256 "d84f6e8c9e20880a47b0aea23d9715e8afaf1b8148740b5b7fbf6d6c585902e9"

      def install
        bin.install "xcsh"
      end
    end
  end
end
