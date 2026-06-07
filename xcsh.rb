# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.14.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.2/xcsh-darwin-x64.zip"
      sha256 "784c8a7ed09d67d20f6b18aa798bd2019f0062cb81ae4ada926879b3d8ca3498"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.2/xcsh-darwin-arm64.zip"
      sha256 "d38359ee86a0769a6bfe83871c12afd2c3f4563f2e495f549389e525ef42ad58"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.2/xcsh-linux-x64.tar.gz"
      sha256 "99fc117ee17162bb15cad4e3022819e1155423af11557b067d309a180e511503"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.14.2/xcsh-linux-arm64.tar.gz"
      sha256 "b9d84cdf8a1aa21692cf6030b9d385b59b609fe344494cd9e54b0493961b8b2d"

      def install
        bin.install "xcsh"
      end
    end
  end
end
