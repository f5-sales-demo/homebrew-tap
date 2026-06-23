# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.41.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.41.1/xcsh-darwin-x64.zip"
      sha256 "e87ef3b13fbf761c3c35cc3fcfb938bb02536064b17fbe4d01873ea03c201618"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.41.1/xcsh-darwin-arm64.zip"
      sha256 "d3da393498446ba05208748bd090d91eeb42e577fb2a2cc5b07d7babd4b90208"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.41.1/xcsh-linux-x64.tar.gz"
      sha256 "88ad1baae1be28cb525158afa8b93576630e6a783db222df1aa34092dd73048e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.41.1/xcsh-linux-arm64.tar.gz"
      sha256 "68ac285a7252dbcee85624af9129d1bb2b743758e5bf5af1a39671eb73a9493a"

      def install
        bin.install "xcsh"
      end
    end
  end
end
