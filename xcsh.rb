# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.75.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.75.0/xcsh-darwin-x64.zip"
      sha256 "1d9ae8a354b58d086e0d8c1a83cbbcde9b35434f5f9ef84f00f19819678d8dca"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.75.0/xcsh-darwin-arm64.zip"
      sha256 "c81a7b36fcd550cf81725d3d15f7f7b4697b607f6f55ff3aecc9621965d4b4d0"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.75.0/xcsh-linux-x64.tar.gz"
      sha256 "bc0a1f191af3a57770a9b1dadcff6567d06332ce8d934be5cb91532947e2ed5c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.75.0/xcsh-linux-arm64.tar.gz"
      sha256 "9e157e44f69abb368066c5e3caada42ebb9504d1c415df63934da824b063cd0f"

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
