# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.56.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.2/xcsh-darwin-x64.zip"
      sha256 "fe4a9bdf8aa301c1dc79151ffeb609b025bb09c038d17ef439da8ae837284289"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.2/xcsh-darwin-arm64.zip"
      sha256 "6641a8a45d780007ab9b5efad1fdca790dc4af0677c9ca31608e5bf98303ed88"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.2/xcsh-linux-x64.tar.gz"
      sha256 "4c745cad1a3d230d4df75268770581a28a800261faf506092ab0d3d661965b9c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.56.2/xcsh-linux-arm64.tar.gz"
      sha256 "6c55737e8dc3b3cd12cb3170182109dc32e5a2ae2df4ef963f8c709c7542d85b"

      def install
        bin.install "xcsh"
      end
    end
  end
end
