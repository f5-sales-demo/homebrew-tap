# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.18.6"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.18.6/xcsh-darwin-x64.zip"
      sha256 "0de72211f3073469f6b691d36a0e0cab9bf985d60dab174e47f2467ec2fd875e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.18.6/xcsh-darwin-arm64.zip"
      sha256 "e2ce69544d3481eecb428985c59420113ba2235440a7e4a1fd1a781202e036e6"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.18.6/xcsh-linux-x64.tar.gz"
      sha256 "d7ebd928777d64361389204973476bbd04b079442b2120806f943192ad109bdd"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.18.6/xcsh-linux-arm64.tar.gz"
      sha256 "c7fce3200f8f926007f50bdf05306fbf523f8c67959f5cc9ffbeceb6130c9808"

      def install
        bin.install "xcsh"
      end
    end
  end
end
