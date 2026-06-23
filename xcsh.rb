# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.40.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.1/xcsh-darwin-x64.zip"
      sha256 "92766f62c7d0d1dbca5c5b983d3c4295cc85fc6085b63874fae57564bb41742c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.1/xcsh-darwin-arm64.zip"
      sha256 "043154577631aa73f312a80f5b4f1e483272e0294030277f64447e30098a1a32"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.1/xcsh-linux-x64.tar.gz"
      sha256 "c9e431eabb01ca552f9b9242d85ea3ab8ee670ba79eaf382095590ba5a00ac82"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.1/xcsh-linux-arm64.tar.gz"
      sha256 "7728e59a4b9bcccace6fa990b78f0ce402ca3e26e103bdd497a3dbb6d3580a6e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
