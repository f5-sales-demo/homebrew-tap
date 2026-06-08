# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.14.3"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.3/xcsh-darwin-x64.zip"
      sha256 "ee85f28fcf9fd0ad3d1dd66937b2f68d257645481f81ac647e51d7f4401f18a1"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.3/xcsh-darwin-arm64.zip"
      sha256 "a13ee0d0b7f475d6644331496c6254bd002f503c0a0a4149023d4f17a6265e83"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.3/xcsh-linux-x64.tar.gz"
      sha256 "2a76626dafc2500fe64a1985df7df9cf76663cb976ee4f2bce25639ec134b9d4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.3/xcsh-linux-arm64.tar.gz"
      sha256 "d36c97f7bdaa2e648dbda45ce8fd046d69c999197ab36f6734c283aecd9cd0c8"

      def install
        bin.install "xcsh"
      end
    end
  end
end
