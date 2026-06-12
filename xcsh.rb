# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.29.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.0/xcsh-darwin-x64.zip"
      sha256 "a9b1307a49786b6618d6557e86bd9d019f7faf97eb4c5b6ea45305a71755d258"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.0/xcsh-darwin-arm64.zip"
      sha256 "5eedc3ee977948e520a30fdb3a2e79cba4d2a39e18894b7d80454c5067c12566"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.0/xcsh-linux-x64.tar.gz"
      sha256 "7fc63291dc2e5f88d27191c19edfd826896d367d2b077fc4f737dce1d21bb38b"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.0/xcsh-linux-arm64.tar.gz"
      sha256 "db83957f0978a7a99c45fc388bbc6c104211f7bb7e941dcdc539df9e3989b5cf"

      def install
        bin.install "xcsh"
      end
    end
  end
end
