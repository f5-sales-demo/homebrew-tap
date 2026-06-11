# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.28.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.1/xcsh-darwin-x64.zip"
      sha256 "421303ea4a17ff5c9f6ff5cb150bbd46f75a259b4d866951e3107b5dd72097e5"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.1/xcsh-darwin-arm64.zip"
      sha256 "464b01ff10f35bf2a43fdc51c2a5bb8e8b2dea02dfb78b579e24ceca1d50217c"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.1/xcsh-linux-x64.tar.gz"
      sha256 "efe0607cedbee8f6d318437f88a49012ef69f4223d6dd73de41a6905a4487120"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.28.1/xcsh-linux-arm64.tar.gz"
      sha256 "6af3ac0a4aec315ae52605c20a3b02c726a98ccba657981fb16c27dcfa4ec560"

      def install
        bin.install "xcsh"
      end
    end
  end
end
