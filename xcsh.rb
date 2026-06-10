# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.23.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.23.1/xcsh-darwin-x64.zip"
      sha256 "9a5b805f3eca63e4545001f505ecc27d5fda0530cc4e73293e307fcd7227f3e3"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.23.1/xcsh-darwin-arm64.zip"
      sha256 "832780441622b2da7d9a9e10db6666973754e17f98449f3f7390f320dc6ba13a"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.23.1/xcsh-linux-x64.tar.gz"
      sha256 "b99f950c6071b75224f113df9721ff7acc10158a5b15fd013e1ca60cb0fd04f2"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.23.1/xcsh-linux-arm64.tar.gz"
      sha256 "76c449d5be56f6437458f1808fb7164533cd977ee73f98c58aa09c97591fe730"

      def install
        bin.install "xcsh"
      end
    end
  end
end
