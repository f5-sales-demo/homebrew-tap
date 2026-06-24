# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.42.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.42.2/xcsh-darwin-x64.zip"
      sha256 "98d60170496172f7f886fc1f9e5051a1dd6cc22060c24347c9f21f67793c1438"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.42.2/xcsh-darwin-arm64.zip"
      sha256 "4b79f6bcf022c8b12de710f0a585becc8f84765dd505a5840c5d559d7c4fba88"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.42.2/xcsh-linux-x64.tar.gz"
      sha256 "635f884c471f04106be1ae4ec74d5a88bbc69c072dad1c85474e42befaf307fe"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.42.2/xcsh-linux-arm64.tar.gz"
      sha256 "61a6031bbe92d7e60dc181e69e36929404f70884575bcdde63d1b5a75191e169"

      def install
        bin.install "xcsh"
      end
    end
  end
end
