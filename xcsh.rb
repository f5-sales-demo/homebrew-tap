# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.18.4"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.18.4/xcsh-darwin-x64.zip"
      sha256 "91087b137be4ef3ae5e6169e09f7339376386c6eef78e273ab7ae24c20cee577"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.18.4/xcsh-darwin-arm64.zip"
      sha256 "53e58dfd0af3ada15a6070da7845142362a020e9662bd89d2edd982693e99433"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.18.4/xcsh-linux-x64.tar.gz"
      sha256 "4c0a3545f03e9df7a8c8bb39f3cdb97c97981be6c12af88e95558a4c021209df"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.18.4/xcsh-linux-arm64.tar.gz"
      sha256 "8a593e3ef67e88e7c43e5f96002553d7468c8e415f114f5fa8816b4a7f959723"

      def install
        bin.install "xcsh"
      end
    end
  end
end
