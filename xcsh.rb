# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.77.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.77.0/xcsh-darwin-x64.zip"
      sha256 "79653248aee5f6dd56a05ab5948aa7d23dd0d8b0bf84d79846de23154f9fc16e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.77.0/xcsh-darwin-arm64.zip"
      sha256 "42333b854cee69037feffc1f9565ef13584459a2ed8c94b5f6576f713c3b21f1"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.77.0/xcsh-linux-x64.tar.gz"
      sha256 "6de9d17192158b7d6faa12a192805f5800bc0a7ee2a96d940054c43a4557c7c4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.77.0/xcsh-linux-arm64.tar.gz"
      sha256 "800941c0c5d00f329784be48be5c6fba9bb8ff9f8ff82a12deb9940a026d2627"

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
