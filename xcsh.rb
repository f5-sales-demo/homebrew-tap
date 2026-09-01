# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "21.5.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.5.2/xcsh-darwin-x64.zip"
      sha256 "6c67d59285a3bffe546562e648c78501d60f4b53c1a92f021e044a9d40fa277c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.5.2/xcsh-darwin-arm64.zip"
      sha256 "c126a44d9a7180e2a28937a0ced8f6bba606c94d1ecc046e5a5477f407b43e09"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.5.2/xcsh-linux-x64.tar.gz"
      sha256 "be8fe50b3b650950b106ac1931335af05f18f162194699883f77f99548654c06"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.5.2/xcsh-linux-arm64.tar.gz"
      sha256 "a9bb79fdb6152b3f82f5be3a2c2d2faa9fa6139362fe1196441979a2b0461cf1"

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
