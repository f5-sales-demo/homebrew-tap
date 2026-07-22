# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.71.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.71.0/xcsh-darwin-x64.zip"
      sha256 "2274c6a03b87d61be3366d032ef47e65de702fed8e6e2e9acdbec4150f16187d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.71.0/xcsh-darwin-arm64.zip"
      sha256 "01a5dc1d3bb83ee88c4fd63166474eee8e1f7cbf360683eb76a58928622989c9"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.71.0/xcsh-linux-x64.tar.gz"
      sha256 "fce36fa5e5ce10ff0f9aea0f545d5f99256ea30b1d6c90143f69cc67f6a85b14"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.71.0/xcsh-linux-arm64.tar.gz"
      sha256 "39354d24c2bb8edfec9dbce6b1677c3e682b29bc171fbe3ff5bf7ede076fecea"

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
