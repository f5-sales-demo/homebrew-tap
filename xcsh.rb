# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.61.5"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.5/xcsh-darwin-x64.zip"
      sha256 "65ed8a14cb2c13f351ac6fc472e3192eea2dc8cf64bd22a3ea982700779affcc"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.5/xcsh-darwin-arm64.zip"
      sha256 "19b1af530c22c2f5c49f3b712e7e30b1d5a1444713d2facfa6be582ef93e4e72"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.5/xcsh-linux-x64.tar.gz"
      sha256 "11b8cc71ae16d4cfef771c68a4fe2d565b73904ba9859a90753d8dc8aaf0b2f0"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.5/xcsh-linux-arm64.tar.gz"
      sha256 "3ee69f77594627398df9bbe93123453e2b584e1e46c0c3aa1754015f622b4b5f"

      def install
        bin.install "xcsh"
      end
    end
  end
end
