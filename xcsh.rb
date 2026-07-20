# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.66.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.66.0/xcsh-darwin-x64.zip"
      sha256 "9bc2d28e7444bc04df5b1da51c09a4b32a9259d75b8fdfbcdc75549eaae48b55"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.66.0/xcsh-darwin-arm64.zip"
      sha256 "94244529656eb8bf5f564b4e244f73ec93ec10b465ed942a0c6dba8ac34e12f7"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.66.0/xcsh-linux-x64.tar.gz"
      sha256 "1e6ca4066d70fa6875ee82ea5e6e3c41cd399d5ebaded58966464c5821903ed2"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.66.0/xcsh-linux-arm64.tar.gz"
      sha256 "e546d30f585452d87d0b6e71515c9d11ad25cf541110b4014e6d500b789a70b9"

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
