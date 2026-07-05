# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.58.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.0/xcsh-darwin-x64.zip"
      sha256 "c9af6b82d86691935a66e0788529b43d78b5d927f93368efe76bab6d3d511235"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.0/xcsh-darwin-arm64.zip"
      sha256 "7b5bac40971d0e4bb127b2023438ca6abb1d47944ec18167622702ea1f33def5"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.0/xcsh-linux-x64.tar.gz"
      sha256 "390d51cf37c1dc3dd7a4c234e118cb15fb8e96d1620f3e1509485b284b682ecc"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.58.0/xcsh-linux-arm64.tar.gz"
      sha256 "8b0f6da3b2a3df4d383c2ebad0680162edaacf1cb5aa186010071d3b147fc5b3"

      def install
        bin.install "xcsh"
      end
    end
  end
end
