# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.61.3"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.3/xcsh-darwin-x64.zip"
      sha256 "631a2203d1945180f0f321fcae955782948a80f774d1852c9a2803ce21b9efe0"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.3/xcsh-darwin-arm64.zip"
      sha256 "0b3b4dafd6dfff5b8d9185cbf91e26f79072090354c918df6027770d136f9496"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.3/xcsh-linux-x64.tar.gz"
      sha256 "e79684124084911459b0c09154e699d4d76994b3a14e7ad37bd544042bd6fb57"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.3/xcsh-linux-arm64.tar.gz"
      sha256 "5461ed2cb7f6caa43ab4e3ae1e8dd5deded9db18121f525ccdaf9cd3a4d03f88"

      def install
        bin.install "xcsh"
      end
    end
  end
end
