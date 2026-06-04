# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.4.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.4.0/xcsh-darwin-x64.zip"
      sha256 "45863ee08e5d5dd6762ef90a81249741f25b60752d0518c891dfe0fa4239f86e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.4.0/xcsh-darwin-arm64.zip"
      sha256 "2003e1465b8c2286215f7027b5add13271eb6e05a648261052442d4a78c77c1a"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.4.0/xcsh-linux-x64.tar.gz"
      sha256 "933fb99befe3d753fe337342783d6d92f6a00e8b9adb2e7257baff62e38c6f8d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.4.0/xcsh-linux-arm64.tar.gz"
      sha256 "4e125541a45976f4752d2067e01b43461e3256ee436066727d49757abfac9a7d"

      def install
        bin.install "xcsh"
      end
    end
  end
end
