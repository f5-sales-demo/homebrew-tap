# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "21.19.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.0/xcsh-darwin-x64.zip"
      sha256 "588ede99c715d3cb1ec7ed57538e443bd4d95d71465ebd14b54696999e7cb405"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.0/xcsh-darwin-arm64.zip"
      sha256 "b36c793e2efeaf733747649baf78f764a25f391bd6194a2e253abb5061d77152"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.0/xcsh-linux-x64.tar.gz"
      sha256 "34a413a4839286607334b58e263626f60a59c5a693add4a199494ff12e89a467"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.0/xcsh-linux-arm64.tar.gz"
      sha256 "ec73d701799e5368318d1b6f59f6152254f13bb2e2b67e149ac06cfab18ed040"

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
