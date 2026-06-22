# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.38.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.38.1/xcsh-darwin-x64.zip"
      sha256 "c71bd72c3af28d844175f311eb87786f670b7aaec840ef45e0cb69a5aef3b9aa"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.38.1/xcsh-darwin-arm64.zip"
      sha256 "03b37e1096b7aa1039d94d534d278ed31d4dad5f948a684aea30ea3df907a331"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.38.1/xcsh-linux-x64.tar.gz"
      sha256 "7d4108e4693da13ced1586e1b87e03a95ae8d82a2210649f346609cb044c3c34"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.38.1/xcsh-linux-arm64.tar.gz"
      sha256 "58c609ec08c9c479a14ff2f1e031edd5cdcffd512ef110d31fd754d09cd1f2da"

      def install
        bin.install "xcsh"
      end
    end
  end
end
