# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.9.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.9.1/xcsh-darwin-x64.zip"
      sha256 "06218c78509f6bb00238fe6f97a2685dd862ad3e3e1160de3366a0f5c1471768"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.9.1/xcsh-darwin-arm64.zip"
      sha256 "58508fe0a9c338343b998aadfbcb25b110ce62b4d6b1662c63547dabc4db88cd"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.9.1/xcsh-linux-x64.tar.gz"
      sha256 "78092d089ed53dd445fb0aa6946966f2ebc5146b1ed47fb1ae363c06991bfa52"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.9.1/xcsh-linux-arm64.tar.gz"
      sha256 "21c1ab687981e7e03423e398f2b5b04cbeea19a9cbdf5597933e087b4b8f585e"

      def install
        bin.install "xcsh"
      end
    end
  end
end
