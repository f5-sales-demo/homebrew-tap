# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.28.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.2/xcsh-darwin-x64.zip"
      sha256 "b3bc59574216f58e939c3173474e744bae6044b14dfa4385f28640df6225b7d7"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.2/xcsh-darwin-arm64.zip"
      sha256 "be8573ad1b0eea98d45a5636d0fe345f0a3536e8447325d744adf541b29b36d3"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.2/xcsh-linux-x64.tar.gz"
      sha256 "7e5cd6f9fae7d37de9678c9bd3ac434281b4f9cbde0fe671acb6a026c68588a6"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.2/xcsh-linux-arm64.tar.gz"
      sha256 "83e6f9c9ba104e7ce99468ca343fb964476be8571c51df60132cb9d212ce9b86"

      def install
        bin.install "xcsh"
      end
    end
  end
end
