# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.58.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.2/xcsh-darwin-x64.zip"
      sha256 "f4d36e4ad1405338d1b545142424c6a896a88bba8033655e8603ddee276ff8a4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.2/xcsh-darwin-arm64.zip"
      sha256 "b89ffcefb59d38383858c2448d99e5e83d1189b82b82b6444bc5ee1edf700f98"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.2/xcsh-linux-x64.tar.gz"
      sha256 "fc0f7a09aa9aa697d4e9bb32df36baffe5043ca0e501cb0e41b3a5427e727215"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.2/xcsh-linux-arm64.tar.gz"
      sha256 "b7a6626259d0ffa149d43a1cae460ae4639d87fc589e9054ace947e8c66a5a9c"

      def install
        bin.install "xcsh"
      end
    end
  end
end
