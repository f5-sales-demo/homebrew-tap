# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.86.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.86.0/xcsh-darwin-x64.zip"
      sha256 "0a8c9d9d2330ed4d501c7e60ba2d9371a67e04bf3cdede121c5bd3f6a212577f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.86.0/xcsh-darwin-arm64.zip"
      sha256 "be3bcf7d1e350ded25c972bb59be575ad84e6d9b24ba1686358f0b343054af52"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.86.0/xcsh-linux-x64.tar.gz"
      sha256 "f2029a63f1afa97049bd26961feec3ede6ae4275c481afa613345cae519821f1"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.86.0/xcsh-linux-arm64.tar.gz"
      sha256 "0f6f01945eff24a635a030c66de275b38dd1ce73a796d988ef0fba58d28ec07c"

      def install
        bin.install "xcsh"
      end
    end
  end
end
