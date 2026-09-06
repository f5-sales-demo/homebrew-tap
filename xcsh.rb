# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "21.15.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.15.0/xcsh-darwin-x64.zip"
      sha256 "8352bfbad35734e9ed345fa0a792f66debc867c246183c1841c0110e7449d95b"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.15.0/xcsh-darwin-arm64.zip"
      sha256 "0adf01609879ba5d04cd715d0c0e7eb396fa7b473abd356821b2777a10deae3c"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.15.0/xcsh-linux-x64.tar.gz"
      sha256 "e4a43f5a5f73ace6eb85f4028fbb914ad6315a2b52b0de5f70c1f97f797c682c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.15.0/xcsh-linux-arm64.tar.gz"
      sha256 "01139c6a8dfbd98b3e113ddb66686ec2d0d433098cedd33ed81f6651b4d71b76"

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
