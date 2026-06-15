# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.30.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.30.1/xcsh-darwin-x64.zip"
      sha256 "6116947d63efc84b754dc258e5db9c86d6cf0548bbad6da46643eabbb4a610c1"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.30.1/xcsh-darwin-arm64.zip"
      sha256 "591f0527862f7ae0eb1e700a2c2e6ca072d02af1c637c3100dbd453c4b5120cc"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.30.1/xcsh-linux-x64.tar.gz"
      sha256 "57c8157ec1afed8613b067221ed96d9fd91a49d22b425bf97dffbe03530d7949"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.30.1/xcsh-linux-arm64.tar.gz"
      sha256 "1816b12de5cdb45d3138c911f32f02c0efc56953431fbd3d9c5a1a05af5fce4b"

      def install
        bin.install "xcsh"
      end
    end
  end
end
