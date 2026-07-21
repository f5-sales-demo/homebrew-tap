# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.68.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.68.0/xcsh-darwin-x64.zip"
      sha256 "1c4d9a96dafce4f743028aaa801e95c47ad9376cf953cdb6ef5657489297f335"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.68.0/xcsh-darwin-arm64.zip"
      sha256 "bd84eae554dda40d53c214d93570732b40d384b8cf4a1bb0c82333d0c8fc2eb1"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.68.0/xcsh-linux-x64.tar.gz"
      sha256 "9d997ade8d832f04a3782f6b144fecb2e66dd078d16c26ffd6606c9ed5ca2ece"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.68.0/xcsh-linux-arm64.tar.gz"
      sha256 "6677058ecae81f1dceca05b6ce5aab3231a7e77f880ce9e5f7303f1d3fdd9990"

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
