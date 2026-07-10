# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.62.8"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.8/xcsh-darwin-x64.zip"
      sha256 "a46e52231726ece4d73670c43c856e5c12f1e57bec8ea4177d146f868db5d573"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.8/xcsh-darwin-arm64.zip"
      sha256 "47c8610ae1faf6c0869ed312ecf1195d0fc15ef5a29ae2228a18d95d8626b3e5"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.8/xcsh-linux-x64.tar.gz"
      sha256 "07f836c3cbd293c660583717e0967e8483714ab83ef64cce7b817b1b81788bd3"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.8/xcsh-linux-arm64.tar.gz"
      sha256 "13b8755a3acf1aa62c75d0f330d786acfb24e1ad3bfeb84c9c646984400be37f"

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
