# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.23.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.23.0/xcsh-darwin-x64.zip"
      sha256 "d307ea344869ef566d3ac4f90fa75f29fdb875a6bfa026cc6941ec46a0ea2225"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.23.0/xcsh-darwin-arm64.zip"
      sha256 "5648d26902cfe98f609e224f4a55887e4cbf6857773a1891deba8dd4f513c1fb"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.23.0/xcsh-linux-x64.tar.gz"
      sha256 "4f64dca7f6a9203c74881d32647156d401cd45a3f8d4003e8d061912a59bedf6"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.23.0/xcsh-linux-arm64.tar.gz"
      sha256 "6408fe978856841c9188a51fb2f1f298f7845ff8ce9791721ca68931b10ba163"

      def install
        bin.install "xcsh"
      end
    end
  end
end
