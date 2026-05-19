# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "18.70.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.70.0/xcsh-darwin-x64.zip"
      sha256 "be9a74552c3ac6f57721405439cb291fa4e7930d05ffbbc45b87861152c504df"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.70.0/xcsh-darwin-arm64.zip"
      sha256 "5db2cf08583c8e32ebf5cc1e0b5e3a8bdab82ada1bb0a029f72a07f08fc64cfd"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.70.0/xcsh-linux-x64.tar.gz"
      sha256 "321ea51be6d0574c416a780913edc9696df8f81e77c56dece288a406e0ab389f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v18.70.0/xcsh-linux-arm64.tar.gz"
      sha256 "ba6e92c4d3764ac5a9af6464d377acdd7233efe1c09d6802cb0914a59f4ec2b0"

      def install
        bin.install "xcsh"
      end
    end
  end
end
