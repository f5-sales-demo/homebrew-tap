# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.102.6"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.102.6/xcsh-darwin-x64.zip"
      sha256 "b3847050133614ed9739482b1d945174bcc6901959002933c80316792570830d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.102.6/xcsh-darwin-arm64.zip"
      sha256 "deab5fb29ed4bc0dc834d52b9bdb6cbe51e4c83d727a74dfd2c24706533b499a"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.102.6/xcsh-linux-x64.tar.gz"
      sha256 "9f677dd6e79b2f20c264662083685c96cbe38d9938ca28e08b6fe1981bc3a4d3"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.102.6/xcsh-linux-arm64.tar.gz"
      sha256 "fdc198390f2f19f5c2616807e146d69fdacc8e08159358b88cfcb8ccf42a8a64"

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
