# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.64.3"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.3/xcsh-darwin-x64.zip"
      sha256 "630e6b5068768e26a59119d69867d64147c3a98f65f1b43ad6c5f02d7306d91d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.3/xcsh-darwin-arm64.zip"
      sha256 "0a3656288f7e2c268db2a2c234e874c3a30d031cdd786b920791006f9da6b453"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.3/xcsh-linux-x64.tar.gz"
      sha256 "d1963fe64417aac7dfd578ea5bb74fa088d50cfe2891f7904e999a493251cf45"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.3/xcsh-linux-arm64.tar.gz"
      sha256 "b039c25b902bcd394c7f6afcee89e6d9c212d6f0b366cd6ea1a97b062ddc9881"

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
