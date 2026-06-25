# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.45.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.45.1/xcsh-darwin-x64.zip"
      sha256 "0ba074d455e5f6c537b6e0e6e2b5f15bf2acba635eee9e5fa1d93b1360aa3a91"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.45.1/xcsh-darwin-arm64.zip"
      sha256 "3a88733f664a3af85f4c7eeabcea81b813223278482da316befbae6f2d110d88"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.45.1/xcsh-linux-x64.tar.gz"
      sha256 "931a93b79a3ed52791d6b3334c95c7188a657fb96833d7e3cac637dddfecf82c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.45.1/xcsh-linux-arm64.tar.gz"
      sha256 "2628b72ec1e6cede6dbd8ba62fb71eb198cec5f7dcd5be9c71e74dc04f5f7383"

      def install
        bin.install "xcsh"
      end
    end
  end
end
