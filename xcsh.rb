# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.63.6"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.6/xcsh-darwin-x64.zip"
      sha256 "ccc214ebbfe822f9f53bde4a6926e7e2705fe8aae181a2825b9add988eb9a72e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.6/xcsh-darwin-arm64.zip"
      sha256 "3ae5be9e867e568d49d79f4c0a4de05061dc3d0002611be20d298c1cb736b191"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.6/xcsh-linux-x64.tar.gz"
      sha256 "b61a2ce5c03d09cb655aecc33d314bd8b7cfd8c2ec8f3349dbc9980ac8c2f832"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.6/xcsh-linux-arm64.tar.gz"
      sha256 "133ce181e62a0dfbedcc24b4dbb8c0cd2e67fb3e8bda5030b49e626e4b3f3094"

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
