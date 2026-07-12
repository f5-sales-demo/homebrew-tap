# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.62.14"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.14/xcsh-darwin-x64.zip"
      sha256 "2ae8867e77d91ca35ef0e09f3e95f21f3d0513704ae3e375bc894d0a89604276"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.14/xcsh-darwin-arm64.zip"
      sha256 "c05c80e5b1d031f44992e33ad6e0f2bea8ae0b817121cfab1f6c8595cc24a921"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.14/xcsh-linux-x64.tar.gz"
      sha256 "595606dc8ef287b4e39a1eaa86ab04c039c1b2365a8ad4ebae73a8970e6e33b4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.14/xcsh-linux-arm64.tar.gz"
      sha256 "2f72c82b9a5bf0fd0adaec4e6db79196e3662d5e9b8cf894b20847ecc5791418"

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
