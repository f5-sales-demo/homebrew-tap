# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.74.4"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.4/xcsh-darwin-x64.zip"
      sha256 "84734fa0ba8a64ce6ebcf158134526f8a739cc2b2863e8d668a798b7c710ce52"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.4/xcsh-darwin-arm64.zip"
      sha256 "b7a5678b70494d7afdcf59985fb5feb016fa36cb9eae5098d300461e9dbd8fee"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.4/xcsh-linux-x64.tar.gz"
      sha256 "d2bd7436b7bb4be7ac36244a80c69aa87a14ca1de8d6d955054ae4fa0be07b35"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.4/xcsh-linux-arm64.tar.gz"
      sha256 "42e9cc775c97b295f524dfad96800e835eb04ab8fdb886b2203427eab3d91823"

      def install
        bin.install "xcsh"
      end
    end
  end
end
