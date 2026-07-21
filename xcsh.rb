# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.70.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.0/xcsh-darwin-x64.zip"
      sha256 "8698fa99518c5e2b32e4cc9945ab43e5bcea25d908b5a89bd0a07b1b53ec174e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.0/xcsh-darwin-arm64.zip"
      sha256 "3aa848dcbcd3616948ffeba6324d4fb2c94fb4c4cdbf9ebe64218c15dccf1a45"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.0/xcsh-linux-x64.tar.gz"
      sha256 "f4efe9625af4785d01996848f78f39441b045ea6573852cb218d10adda4e886e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.0/xcsh-linux-arm64.tar.gz"
      sha256 "1da89fd6370e3adb1f1f8d588d682b3262951cf227baa65bc37632d53ca78402"

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
