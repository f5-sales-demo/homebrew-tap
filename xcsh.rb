# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.41.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.41.0/xcsh-darwin-x64.zip"
      sha256 "89f1e09c1f00b5594255952d186da431eac9efb9d5cb0e60636c76ac09fe6cc9"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.41.0/xcsh-darwin-arm64.zip"
      sha256 "c935a274e23c70bdd088ccf4abc5fba7b9f24568d717959a2eaacca46da845a5"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.41.0/xcsh-linux-x64.tar.gz"
      sha256 "1f50cc46c61c9f7f618e4b4b311a484929532a968fb32e8167f1b55f1e7c333b"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.41.0/xcsh-linux-arm64.tar.gz"
      sha256 "289d9413c818180b815b7d484fb72278e151d50642a56670108b49390fa06895"

      def install
        bin.install "xcsh"
      end
    end
  end
end
