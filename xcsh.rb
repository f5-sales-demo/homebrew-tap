# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.55.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.55.1/xcsh-darwin-x64.zip"
      sha256 "4b87ecc1259b343c087dffa27d8047648e8265907a044aaea591a182de26ccdd"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.55.1/xcsh-darwin-arm64.zip"
      sha256 "c31417cc8826c53ba8b01b63324d38de57055d5ac48bb17c8d9c479fd61797ff"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.55.1/xcsh-linux-x64.tar.gz"
      sha256 "f80b6b0f16e12316c5ed54d3f54f53d11fb0084049e107cafb542347efec5545"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.55.1/xcsh-linux-arm64.tar.gz"
      sha256 "dc35f1f870e78b86301dc739e59b59c35b0f05766b63a3702caf4e050309fbf7"

      def install
        bin.install "xcsh"
      end
    end
  end
end
