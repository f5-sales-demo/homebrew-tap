# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.64.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.2/xcsh-darwin-x64.zip"
      sha256 "2c4078a6cb86ac8d2bf434cffd9ca5c219ea4842286c7acc676a0d611bbb1a8f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.2/xcsh-darwin-arm64.zip"
      sha256 "92a9b044ebf8ad5f125a2d1f770254cea4f5e1154edadac6c2d01b34c2151a5e"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.2/xcsh-linux-x64.tar.gz"
      sha256 "abee9da131c5f16fc1f1632a2ab99035d407318a2006cc67f6c6c7c2a2ddab51"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.64.2/xcsh-linux-arm64.tar.gz"
      sha256 "ce20547daa700da11d783e5dc54475f7be3fb7c74942fdb937fa49701cc5e478"

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
