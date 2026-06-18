# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.34.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.34.1/xcsh-darwin-x64.zip"
      sha256 "17f8bed7299ee8dee1758e5130996f586aa35dc1cc84b95991e726862f12d4bc"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.34.1/xcsh-darwin-arm64.zip"
      sha256 "98e2927a47330f57ba896d6a2758d90824cf899a9fafa4354e01a82f053cc7cc"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.34.1/xcsh-linux-x64.tar.gz"
      sha256 "3ac00a141dd8c41398774510e8428347143d46440b4e353dddab66539e24cbf0"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.34.1/xcsh-linux-arm64.tar.gz"
      sha256 "4a89e9753877d3a27277ddf56d024d671cda7a67b095429510da91d7e3ad1be4"

      def install
        bin.install "xcsh"
      end
    end
  end
end
