# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.61.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.2/xcsh-darwin-x64.zip"
      sha256 "38c7ff60e5f7e1fd628660ce41ac4789ef1aebd602c8818122a45fafa1b09f7f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.2/xcsh-darwin-arm64.zip"
      sha256 "bcc3272da9ce135699fc37d541b4d56503bac7fa6f8c1776631ebe0d79b0a99e"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.2/xcsh-linux-x64.tar.gz"
      sha256 "ebdafb01e519444c8a304b10f1261932288d7e69ef7f2762180d0ff7b22965a9"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.61.2/xcsh-linux-arm64.tar.gz"
      sha256 "ec1be3c865e06123f25eeff7d9f429bf62c40d9e182642752185faf6d70a6b29"

      def install
        bin.install "xcsh"
      end
    end
  end
end
