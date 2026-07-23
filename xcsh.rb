# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.79.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.79.0/xcsh-darwin-x64.zip"
      sha256 "6048c6fede23ed099493654e693a4cf2593a4d131a0345c95ac729cc01cda896"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.79.0/xcsh-darwin-arm64.zip"
      sha256 "319cfcf4ea4541c253f7d9080d1194cada842ba99fc0a71cadb15ece4eba0ee9"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.79.0/xcsh-linux-x64.tar.gz"
      sha256 "0bfafe8c178dfd2cb711c8bb167ddf1d5f70d837a4a9fcabc232428548f57787"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.79.0/xcsh-linux-arm64.tar.gz"
      sha256 "7297b22365601c1aea1009daa520efc3e51f7bfcce4ca9c351d82febe88a3269"

      def install
        bin.install "xcsh"
      end
    end
  end

  # After brew (re)installs the binary, recycle the running manager so the upgrade
  # takes effect immediately: refresh the native-messaging wrapper and ask the old
  # manager to step down (it lingers on the now-replaced binary otherwise). Uses the
  # just-installed binary, so the new version drives it. Best-effort — rescued so a
  # sandboxed or offline post_install can never fail the upgrade; the manager also
  # self-recycles on its next sweep/provision.
  def post_install
    system bin/"xcsh", "chrome", "recycle"
  rescue StandardError
    nil
  end
end
