# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "20.2.7"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v20.2.7/xcsh-darwin-x64.zip"
      sha256 "7b2c40aed5d47e701c2ad423a0be4b5ec445428353b8afb7788ecedc6da5cdc3"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v20.2.7/xcsh-darwin-arm64.zip"
      sha256 "3326e5a02f5856456c5b338eb4309074b9495dd1efd86369bbff4310dae04f31"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v20.2.7/xcsh-linux-x64.tar.gz"
      sha256 "3d6eb77f622a96d7bfaa6eb5662735c59841df21939dc52d55b4e92b8049c4d7"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v20.2.7/xcsh-linux-arm64.tar.gz"
      sha256 "2e2eb980e1f197ba295266b0a3a2f698b3ae8f826a813a927bff5d761324efd5"

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
  #
  # Likewise stop a running "office serve" holding :8444 on the now-replaced binary,
  # so the next "xcsh office serve" starts clean instead of "port 8444 in use".
  def post_install
    system bin/"xcsh", "chrome", "recycle"
    system bin/"xcsh", "office", "recycle"
  rescue StandardError
    nil
  end
end
