# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.83.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.83.1/xcsh-darwin-x64.zip"
      sha256 "29c36cdb12ead94aa7b882b36baa66f581afb552581453626416204db04f8ed4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.83.1/xcsh-darwin-arm64.zip"
      sha256 "ae4ff41880bd2fe5c7278e23e6e799bb0ae2e1877320660cf4036c3208d973da"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.83.1/xcsh-linux-x64.tar.gz"
      sha256 "8f4a5ff48345c76870af02ffaef0bffbc6f0d6ee7b024fbd6645a69eaff925da"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.83.1/xcsh-linux-arm64.tar.gz"
      sha256 "b47716eac0406d07a2ac3cfeee7eb34ba75e025e87eff0680a6a21634699dfba"

      def install
        bin.install "xcsh"
      end
    end
  end
end
