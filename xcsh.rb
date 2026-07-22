# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.73.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.73.0/xcsh-darwin-x64.zip"
      sha256 "892f3af5b44cc18205e12f941d8f954bf0dab71a01727bc8708bdea936567306"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.73.0/xcsh-darwin-arm64.zip"
      sha256 "2f734a9348c4590a3f44e8b86209415c191cbeece7f45213dca07f5f7a0a2f7f"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.73.0/xcsh-linux-x64.tar.gz"
      sha256 "47df8374baf7b6c307441c2122f5b1d7fec2f3b240fece7b5334f7d24b45b606"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.73.0/xcsh-linux-arm64.tar.gz"
      sha256 "e82d252d66c5473e0c13a4c8d91fe982a71a248661b07445dec348880cdf1af1"

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
