# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.80.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.80.0/xcsh-darwin-x64.zip"
      sha256 "5677a49fe71ebc1e8765698abc432600d0061de0cf8c14eb7fabf5a3b3c85092"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.80.0/xcsh-darwin-arm64.zip"
      sha256 "699e16becfcb818a499b61d98a48efb1f57aa99ff4f5186de87ab44121723104"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.80.0/xcsh-linux-x64.tar.gz"
      sha256 "ef41fc0f043e3e061e8e5011d98e82aa98fb4f7d00d95ac08e6400eb23f04f97"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.80.0/xcsh-linux-arm64.tar.gz"
      sha256 "2e048c2af586d8753593ad1c697a3baed751859a6ed9f9b4716c9efda9e4f712"

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
