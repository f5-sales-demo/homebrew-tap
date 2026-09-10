# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "21.23.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.23.0/xcsh-darwin-x64.zip"
      sha256 "e1138260ec341359c79fdffa984732dbd6982e87a847de47acdc8501cee1b785"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.23.0/xcsh-darwin-arm64.zip"
      sha256 "6d792591aabb32d9ef1c61f22513776f8c87242c86ce47c248cf957476a1b3fa"

      def install
        bin.install "xcsh"
        libexec.install Dir["pi_natives.*.node"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.23.0/xcsh-linux-x64.tar.gz"
      sha256 "03366c5abe28049d10960ea0144f47ccae0d6948c22eacede10bae23e0c3428e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.23.0/xcsh-linux-arm64.tar.gz"
      sha256 "4c33e3618e18e1efac2c6a5f6a87ed84917d9d86b3782f7179a3fe51eb34f0f2"

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
