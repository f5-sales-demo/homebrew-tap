# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.61.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.1/xcsh-darwin-x64.zip"
      sha256 "5c37c3f21de73204f45fbab79602cd388e376e85cf6f173ec70ebe299fd43df4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.1/xcsh-darwin-arm64.zip"
      sha256 "519875dca81f6d21266f6140dda4d1407b1457d6f25ba672b4b9e359efa4d736"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.1/xcsh-linux-x64.tar.gz"
      sha256 "587b35d8f4f1b5079aec00ac5ef556f89ec72808280d8de25f0dbf942a3744d5"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.1/xcsh-linux-arm64.tar.gz"
      sha256 "6b27eea8c405a5f490ba921bcff179e8d53f30cac80d991813bf178aa7dd39e5"

      def install
        bin.install "xcsh"
      end
    end
  end
end
