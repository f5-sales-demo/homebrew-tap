# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.14.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.1/xcsh-darwin-x64.zip"
      sha256 "5d439545e367256edb8de0e8341b0ddafbf4ac6fffd198addc7d267b9e396780"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.1/xcsh-darwin-arm64.zip"
      sha256 "8948a90d1aec2bf5241c0cb00b8378437040661510b19a9af463a0cb62e16714"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.1/xcsh-linux-x64.tar.gz"
      sha256 "a20dc68ecb2238a3e9c88d69992a816e74024ba16727c8f426a2fd8836062fa5"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.1/xcsh-linux-arm64.tar.gz"
      sha256 "71c546afbcdf32fa41fbc19ec21d07a87abfa45048448de857ea29d6d65e0f3b"

      def install
        bin.install "xcsh"
      end
    end
  end
end
