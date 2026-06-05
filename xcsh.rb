# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.12.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.12.0/xcsh-darwin-x64.zip"
      sha256 "197d209476404f08a7eaaedeea5c0bba13062c7485fdb8eda5bef462cc1d840d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.12.0/xcsh-darwin-arm64.zip"
      sha256 "7cd4ff56cb87136e0937fcb6c0f2d1f8041d03739a0bfb49d38e068c71eb9cd3"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.12.0/xcsh-linux-x64.tar.gz"
      sha256 "5917862e3706212ac66a2dd9eaea0d4a4d42b36879bd9c6f247d7c618c50c4e5"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.12.0/xcsh-linux-arm64.tar.gz"
      sha256 "128043cb5b41169bbefcbda40b24893b7e3863fa63b1e3a4a888dffac3032716"

      def install
        bin.install "xcsh"
      end
    end
  end
end
