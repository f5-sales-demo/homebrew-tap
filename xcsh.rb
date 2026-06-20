# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.38.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.38.0/xcsh-darwin-x64.zip"
      sha256 "07615af6c8560ae32c69e67187c6736d106b3240b268609d11a7b6878361a56c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.38.0/xcsh-darwin-arm64.zip"
      sha256 "6e1770020f039b6899e4066c9c2195296c8bf34d80fb51808828f727d3e5259d"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.38.0/xcsh-linux-x64.tar.gz"
      sha256 "23cf7d117ce0ae48155ac3ac3145cfd30372adf7b40dbcb99ad9b6179226c696"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.38.0/xcsh-linux-arm64.tar.gz"
      sha256 "3ce1302e99e0ebe3cd0dacec15975718fd9281982b83e9792b09e54f16ed8ee1"

      def install
        bin.install "xcsh"
      end
    end
  end
end
