# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.56.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.1/xcsh-darwin-x64.zip"
      sha256 "cf097a51a61e5495df3024d1ef7dc213c66adcbea56ddf70e067312bae350120"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.1/xcsh-darwin-arm64.zip"
      sha256 "9c68a50f911ea25c80924da4912620b0de1b5f85a122e9b381e037bab1da0738"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.1/xcsh-linux-x64.tar.gz"
      sha256 "45a7a20887e9ac2d43f4c9a300c3c0d32e429726fdd7b44bb000abd269ac9c12"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.1/xcsh-linux-arm64.tar.gz"
      sha256 "43f08cb29657e6c373bca142442a6eb1ec2b0fe319be8afd12bfacbe92bcf23f"

      def install
        bin.install "xcsh"
      end
    end
  end
end
