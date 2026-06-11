# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.28.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.0/xcsh-darwin-x64.zip"
      sha256 "7bafce9ccd815f42e4a2278e3e713272a94390485fa88dfbc627cd2ca1f95e81"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.0/xcsh-darwin-arm64.zip"
      sha256 "0adb8f379823edb432e81903edc9fe50e9f95f289a5c5ded50f92efa98877591"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.0/xcsh-linux-x64.tar.gz"
      sha256 "17dd5a5a3b5ac8ce288b822ba164052eef238ddb787385c841022710baa8775e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.0/xcsh-linux-arm64.tar.gz"
      sha256 "606eade7462f9a1df7d285a2add3463d9717104c6fa255ca04647f3a28ae96d0"

      def install
        bin.install "xcsh"
      end
    end
  end
end
