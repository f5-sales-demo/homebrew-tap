# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.40.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.2/xcsh-darwin-x64.zip"
      sha256 "20851b3f3758ae6bd138f476b8c77e2cc66d3e34701533bd42e7744c55c6e24a"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.2/xcsh-darwin-arm64.zip"
      sha256 "8abb09ca4454b5d699663d3569a011fa69ab94786eb861237750c9518c3a89a1"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.2/xcsh-linux-x64.tar.gz"
      sha256 "afc75126d279e7a976f667ee208f4e7cd598e05d14e34ea4f04f99749ee3c768"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.40.2/xcsh-linux-arm64.tar.gz"
      sha256 "b20d164984d9b273f6bdb63ba85e2314335ef508bbcee32ea1f0d63bbd40d844"

      def install
        bin.install "xcsh"
      end
    end
  end
end
