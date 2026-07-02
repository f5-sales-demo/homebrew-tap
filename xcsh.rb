# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.55.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.55.0/xcsh-darwin-x64.zip"
      sha256 "c0b1b38fc79b06987a07e7bc7269bb6aba0df5f6d665490db0ea018a570f2bf4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.55.0/xcsh-darwin-arm64.zip"
      sha256 "33158bc8602e4176136ee444753365aead7a1e08b5db06848f91112fb56d5774"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.55.0/xcsh-linux-x64.tar.gz"
      sha256 "559e5bb51164457777f76a6d173c4715c99acdac32250e5727ff79468cfcaa24"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.55.0/xcsh-linux-arm64.tar.gz"
      sha256 "320cf8428bb4545a9e0b6690b6c34f36de045efdc7167cf0d9319bebf9c5ef4b"

      def install
        bin.install "xcsh"
      end
    end
  end
end
