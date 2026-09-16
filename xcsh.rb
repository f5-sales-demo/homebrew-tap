# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "21.29.3"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.3/xcsh-darwin-x64.zip"
      sha256 "4959d9ca6ca5d7cd56926c893a3822202564f36185d8ea5f2e7dedd78323afe6"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.3/xcsh-darwin-arm64.zip"
      sha256 "1dac044a6c1fbc87fa7c7cb8264aab0ac3465a198150f61f982160fd33a27ef9"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.3/xcsh-linux-x64.tar.gz"
      sha256 "2733584c18176cd7263197f47cbe142b433185a608008cb043c7f97190a05b05"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.3/xcsh-linux-arm64.tar.gz"
      sha256 "b4ca69290a5ef9bbdcc7c36f76f8444e3e28915763d661cb5af1bdff999a57f4"

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
