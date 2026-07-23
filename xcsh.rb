# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.81.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.1/xcsh-darwin-x64.zip"
      sha256 "55570de4ec9bd0fbdd29b475226cd26080267b2d6775b32e1c206827d0cba390"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.1/xcsh-darwin-arm64.zip"
      sha256 "b65a08cb58ed642a06ee4e59b9e1bcbc8a6615ac99cd87f5da05df4d33999476"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.1/xcsh-linux-x64.tar.gz"
      sha256 "4b2ea95fea942eb4c5215b56bef31379fa7eda1f05aebf89e6d0c96f1fc17546"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.1/xcsh-linux-arm64.tar.gz"
      sha256 "e7413fb6a79ce5080fccccaf51e63d126fde3a5288b370ba9e64c0f2ca492840"

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
