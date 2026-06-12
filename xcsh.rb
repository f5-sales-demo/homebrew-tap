# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.29.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.1/xcsh-darwin-x64.zip"
      sha256 "4224723fe1f746d4d3eecdc13784d66bc5b570d5d8e687a07b20316be9ebbfa2"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.1/xcsh-darwin-arm64.zip"
      sha256 "d4b07a512abb5cac4216f3a4189cdb830ae7a63cd49ab885579bed29d21c2e58"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.1/xcsh-linux-x64.tar.gz"
      sha256 "e207323819ad7b587a2bfa2f4c4b0a160f11e9e9c63ce9e406dc7706a79d9387"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.29.1/xcsh-linux-arm64.tar.gz"
      sha256 "6ce43b55547339726b789b34d3b7a05af4410dece627b01edd4d992c9a911bfa"

      def install
        bin.install "xcsh"
      end
    end
  end
end
