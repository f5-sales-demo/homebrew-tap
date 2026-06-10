# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.24.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.24.0/xcsh-darwin-x64.zip"
      sha256 "ce05a1df360b0cf62d6a7a3b765ca02df01c03a1cbdc973f53cddc8ed919603f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.24.0/xcsh-darwin-arm64.zip"
      sha256 "5b0ecc72ddae8ee0af87b1494096fe62d3296040cfd638b9f2261f698b342f57"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.24.0/xcsh-linux-x64.tar.gz"
      sha256 "106c08707e072db5382d0a95413f4e229754e176664ff9ae82323ab76501acbb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.24.0/xcsh-linux-arm64.tar.gz"
      sha256 "b7c19fe3ebc3db26d2437c540383fe4d82ae0597a38f04444880625d7343c766"

      def install
        bin.install "xcsh"
      end
    end
  end
end
