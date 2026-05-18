# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.69.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.69.0/xcsh-darwin-x64.zip"
      sha256 "7e484e0df1f7837d77a530122013cdde4323a3c06c9bc2de8bc3b6ff3c1f99d0"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.69.0/xcsh-darwin-arm64.zip"
      sha256 "3db8712e77011e3da753778caa37d953bfee4f252246a209540c394832dda1cb"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.69.0/xcsh-linux-x64.tar.gz"
      sha256 "7d1970011a11e1575121c752a476ba709978c6893c508efe3361f46421f6e671"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.69.0/xcsh-linux-arm64.tar.gz"
      sha256 "8bf33dccb0e8f55696849f64d8e9fced85eeec3434fddd5cc5743abbb29eb88e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
