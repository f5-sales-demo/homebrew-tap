# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "21.21.3"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.21.3/xcsh-darwin-x64.zip"
      sha256 "2873d42814980c3362fcacff70dc8357829fec0bfe244bbfbf774e94874bad26"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.21.3/xcsh-darwin-arm64.zip"
      sha256 "62d3c0172604c6f926c66ca05e966daa828cb2a1f34ef0bcd058aaf5b4a6f313"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.21.3/xcsh-linux-x64.tar.gz"
      sha256 "bf5c0ab34d92e5ce6d5e700b09266b4405f3186225c8e20f819f296a29f6660d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.21.3/xcsh-linux-arm64.tar.gz"
      sha256 "6d3e041f23f59a5fa2a8287135cd8371bf265e2d1622b2f4087a253bcb034bf6"

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
