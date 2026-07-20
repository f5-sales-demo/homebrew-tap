# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.64.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.0/xcsh-darwin-x64.zip"
      sha256 "56c1a979abbcacdef97e628d47dc9dad48a6e0502ed9c12adaaa3ed0444a96b1"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.0/xcsh-darwin-arm64.zip"
      sha256 "dcac950673304ef6fd7fb78037459739b92c2c08d5f3ffadcb8b2eb61722f09e"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.0/xcsh-linux-x64.tar.gz"
      sha256 "529c406119d816d1203d2b6b1aa08c78826c37d1341ff0a3d7048ba29001cdbf"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.0/xcsh-linux-arm64.tar.gz"
      sha256 "85769cb9d34db1f373b97d8bb39c0b5723e98e3c795f3d686f4adc0696351ef8"

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
