# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.13.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.13.0/xcsh-darwin-x64.zip"
      sha256 "bac4d309444267fefba0e0c16b43a8411af87e6ead798fdaddcfed15d061a6ae"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.13.0/xcsh-darwin-arm64.zip"
      sha256 "02bcf15a4385e006fe538bd1ef443ee1932e5bf24ecf0e2aeab794b0b1cc52f4"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.13.0/xcsh-linux-x64.tar.gz"
      sha256 "de06fb724901fbe4215727770cd150f366fc59798a519ed0f09e8455cd0dcfbb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.13.0/xcsh-linux-arm64.tar.gz"
      sha256 "6dbc4bb22ca576b7bfba2cf3fe30bd28f47c6b127159e4860bb20fd91a517647"

      def install
        bin.install "xcsh"
      end
    end
  end
end
