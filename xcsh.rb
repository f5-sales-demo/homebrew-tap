# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.74.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.2/xcsh-darwin-x64.zip"
      sha256 "eb3b24325c1f65c49e00f8f3d20b3bb72e27be9cd18818257d4265023807794a"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.2/xcsh-darwin-arm64.zip"
      sha256 "b507089ead14dc695ae1515be7fdb10a49b453c81e66cd87ef932ca57680e960"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.2/xcsh-linux-x64.tar.gz"
      sha256 "3d5cdf5a6a29ee4b3953c0192a18d9615e3456f1ec977dbba6a33f45cf1747ef"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.74.2/xcsh-linux-arm64.tar.gz"
      sha256 "f0343c03e4c468ac119a1157f4c8643fcb5660435f2e29b02d41124af14cc116"

      def install
        bin.install "xcsh"
      end
    end
  end
end
