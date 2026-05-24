# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.78.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.78.0/xcsh-darwin-x64.zip"
      sha256 "33ba7c62c92fe97c3b87af7817017c5707828641be6d9cf02ccf04781e41d6b5"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.78.0/xcsh-darwin-arm64.zip"
      sha256 "943de6f7ab742f35d761af3d777812d0aa8fc9f4b76d090f35ed502b652007a2"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.78.0/xcsh-linux-x64.tar.gz"
      sha256 "df7934061da36d81015eb42850f529f611d72a1b4f97ea99953a3baeef09b402"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.78.0/xcsh-linux-arm64.tar.gz"
      sha256 "e9936247adffa6a269ecbb29fc5dccc4adef58de8b03fe780deea98f89bedd3e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
