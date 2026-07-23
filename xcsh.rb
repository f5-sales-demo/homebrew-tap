# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.82.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.82.0/xcsh-darwin-x64.zip"
      sha256 "6ff5c456fb4c13f1bf4dd030d8668cb90233f7d222dae8dffd04accf8d0216e3"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.82.0/xcsh-darwin-arm64.zip"
      sha256 "17b64529fd832c1d2adbb7813341bfbea47486ae405ada80dcb5394862142eb6"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.82.0/xcsh-linux-x64.tar.gz"
      sha256 "423a905e0018f0a0a2bd4c44077cebc3f180432e101fd6d86b27a4cc93cf35f4"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.82.0/xcsh-linux-arm64.tar.gz"
      sha256 "52373d623c9fce349a300d766177eee099cd225b4176a4dbc0bcd25cb839ac6f"

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
