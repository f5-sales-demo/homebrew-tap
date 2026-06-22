# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.40.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.0/xcsh-darwin-x64.zip"
      sha256 "ef015c7e53a5ed056d8006a25acbc7f9181a8daf002d4220ab6ef610fd4b5a40"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.0/xcsh-darwin-arm64.zip"
      sha256 "e78575daa9723bf9f86ce4103f921cb58b237041400b2781683911f493400cd1"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.0/xcsh-linux-x64.tar.gz"
      sha256 "43b59c64f57b4b410aece5a1ccd11cd45f37b4766d777a558ef49e397ba540dc"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.0/xcsh-linux-arm64.tar.gz"
      sha256 "0e1b015570abdac889ca782253b6f9764fe3711d57b7f7b38ee5cf43c85c2834"

      def install
        bin.install "xcsh"
      end
    end
  end
end
