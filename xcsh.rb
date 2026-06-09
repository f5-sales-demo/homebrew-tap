# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.21.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.21.0/xcsh-darwin-x64.zip"
      sha256 "da582351c80ad5fafcee538ea3fa31b79f856fe5e5a7c15c3790cd5fb4587b36"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.21.0/xcsh-darwin-arm64.zip"
      sha256 "670d531be5799ef13736638efec9c3366bd6d1263814b00938cc8f51716aadf5"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.21.0/xcsh-linux-x64.tar.gz"
      sha256 "d92f5163fb6ce7140dd32b86d085b45efbbfc3a8901ebf5d418becfd861863fc"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.21.0/xcsh-linux-arm64.tar.gz"
      sha256 "c9c63fe1da78a6da56dd45389eee1235fcc22a421def92e31a93bc9288cd4c04"

      def install
        bin.install "xcsh"
      end
    end
  end
end
