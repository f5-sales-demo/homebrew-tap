# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.15.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.15.0/xcsh-darwin-x64.zip"
      sha256 "50399f8c17245b52bf9c9e08db02021c2851b125051d1191934bdf06c514a89c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.15.0/xcsh-darwin-arm64.zip"
      sha256 "fb55fc43e4661fa4e3667debbe96294dd5c4425dd85919c67710d3efb32ab4e4"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.15.0/xcsh-linux-x64.tar.gz"
      sha256 "0361a11e68a950aba2566bde8b94fbaa1fe07571f7530c1d9a3f12e1fe2f384f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.15.0/xcsh-linux-arm64.tar.gz"
      sha256 "03c62d47b7c254adb85e2e6a7692ffb09e5068aa1e66d0693b18efe760f6ad50"

      def install
        bin.install "xcsh"
      end
    end
  end
end
