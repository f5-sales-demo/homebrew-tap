# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.74.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.2/xcsh-darwin-x64.zip"
      sha256 "6ee449370cd207fdef9425e21ca03508bed28b9c5c9bb11b2cb92da05cea8eaf"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.2/xcsh-darwin-arm64.zip"
      sha256 "38e74b4fbb11e1f264f2ee777581100e621e0c447188f4e6adfe7de554931353"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.2/xcsh-linux-x64.tar.gz"
      sha256 "f7d267d0b319c1ce3cc76a28b58945a9fcf3d59f27ab72b19cee948222756abc"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.2/xcsh-linux-arm64.tar.gz"
      sha256 "01f104075f232ed8e260aa7b77e7cb12422f743624a9f1b1b0f5018b62eab258"

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
