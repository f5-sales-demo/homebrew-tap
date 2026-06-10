# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.22.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.22.0/xcsh-darwin-x64.zip"
      sha256 "31338f7c86da728593b3c94b9f14f507a9ab21d185148a57c82be27a308a2f18"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.22.0/xcsh-darwin-arm64.zip"
      sha256 "7085709476d8caf7d09f6bffd53c1ecccf69598132bfd59be80339bc9f521dc7"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.22.0/xcsh-linux-x64.tar.gz"
      sha256 "9341bcb3560334d7bb453d5d48a0b194da0ea072db77de30c6c8c42725236587"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.22.0/xcsh-linux-arm64.tar.gz"
      sha256 "396c6044cc39d90c0eccff8abb86e84ea73cbab6177a5017e2362b924a0e7d33"

      def install
        bin.install "xcsh"
      end
    end
  end
end
