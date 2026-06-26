# typed: false
# frozen_string_literal: true

class Opencode < Formula
  desc "AI coding agent for the terminal (f5xc fork with LiteLLM fixes)"
  homepage "https://github.com/f5-sales-demo/opencode"
  version "1.3.13-f5xc.8"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/opencode/releases/download/v1.3.13-f5xc.8/opencode-darwin-x64.zip"
      sha256 "694383a6ea587ce819bc810213bc4684e62252326daabef7e921c466dd5fe78b"

      def install
        bin.install "opencode"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/opencode/releases/download/v1.3.13-f5xc.8/opencode-darwin-arm64.zip"
      sha256 "355417192f7164d96ee9a130e4a460b18ecb0654ba4ef6014f9023a5ec5610f7"

      def install
        bin.install "opencode"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/opencode/releases/download/v1.3.13-f5xc.8/opencode-linux-x64.tar.gz"
      sha256 "a2a959c8cebd457b2799d8d5df64c84a2e712c1acb94cbf0b5215499fb22bfaf"
      def install
        bin.install "opencode"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/opencode/releases/download/v1.3.13-f5xc.8/opencode-linux-arm64.tar.gz"
      sha256 "74d48afe0f78627c80cd3a498ded1da37e8d3b84b3ae88c4c9c8d7d7720015f5"
      def install
        bin.install "opencode"
      end
    end
  end
end
