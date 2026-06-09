# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.19.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.19.2/xcsh-darwin-x64.zip"
      sha256 "23c19dbb25388020f89fc94ed6a85f2ac7107ac973ab73151af6e96efe053ba5"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.19.2/xcsh-darwin-arm64.zip"
      sha256 "f3b9e21f3514936e41292c5ca5d107533e8e1f4595431208cc9a0c15320421a8"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.19.2/xcsh-linux-x64.tar.gz"
      sha256 "cb4ad81f3503800d57394b534947b605d042064c1745df84c21b3898d7962f79"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.19.2/xcsh-linux-arm64.tar.gz"
      sha256 "bdf64e94032d6cae00f423e320cda0cdd50e30972593b814967fb0c98c4e8f7e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
