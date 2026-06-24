# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.43.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.43.2/xcsh-darwin-x64.zip"
      sha256 "d0b571b0b7803efcba72461b6bfb0da02205d4a1f881e00ed6fb37c04dd249b9"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.43.2/xcsh-darwin-arm64.zip"
      sha256 "d70f7e6004c8162086e58b7a92d42db01f072a0e79f509b07916929e92e008e2"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.43.2/xcsh-linux-x64.tar.gz"
      sha256 "7f6391be5a3e9be5a68cbf5cc340333df1cdcae32488e277729806338c885825"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.43.2/xcsh-linux-arm64.tar.gz"
      sha256 "df2e64f99061b8bc6242e9bf0b904c616dda1d02165617ff6f3b588decce8823"

      def install
        bin.install "xcsh"
      end
    end
  end
end
