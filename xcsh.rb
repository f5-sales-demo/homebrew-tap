# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.81.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.2/xcsh-darwin-x64.zip"
      sha256 "f159d9c166d870008c9e37a1d7a5e82f4834119f873405ade8a2ff47e2c21267"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.2/xcsh-darwin-arm64.zip"
      sha256 "14785b4012555e99ec0e5c2726b82fece8ca0c3e1ca414f488a46934ad5ef95c"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.2/xcsh-linux-x64.tar.gz"
      sha256 "3b795f28dd4f3df279596eb789886d9a9eda3ccd5264323fa282d93cca7e8d5e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.2/xcsh-linux-arm64.tar.gz"
      sha256 "35610c5c1b6f59d1e486236f3a405f1bb9670b266e9547c2db71de3697635bd1"

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
