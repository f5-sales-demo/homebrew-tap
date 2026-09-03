# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "21.10.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.10.0/xcsh-darwin-x64.zip"
      sha256 "fb25cb11050700af6ba6c88725b9057e2617d7148654ac65d4d1cddd0b4efcf0"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.10.0/xcsh-darwin-arm64.zip"
      sha256 "005c9a0f9550eacc593e4e4dd22abed75f65979267c2e28fbcab5076e8d974f5"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.10.0/xcsh-linux-x64.tar.gz"
      sha256 "7d1a7bab08775e5c252f9b8dee4d8d13989c631ee00dbfa51e088445fdedcd11"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.10.0/xcsh-linux-arm64.tar.gz"
      sha256 "470b9001394dbb12a40d3ca437b462cd7fc9ae2754c6dd537fcb99ef85222bdd"

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
