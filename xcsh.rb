# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.5.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.5.1/xcsh-darwin-x64.zip"
      sha256 "d3778dfa563206c54c372e416d4850cb129182c549e582fb0085f74fe80dddc5"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.5.1/xcsh-darwin-arm64.zip"
      sha256 "596534ae0ef1d25520962257c5f1e92474bae518b59b2dba8d5198992e9c3f26"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.5.1/xcsh-linux-x64.tar.gz"
      sha256 "0c04557667c3eab10b921644bd7afea34e085e6ef75227895f677fff5d5dadfa"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.5.1/xcsh-linux-arm64.tar.gz"
      sha256 "e13484b98743f93ef688855e214ba02577ee3ced246ff7503c1bbe8f71772b34"

      def install
        bin.install "xcsh"
      end
    end
  end
end
