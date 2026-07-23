# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.78.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.78.0/xcsh-darwin-x64.zip"
      sha256 "9b2596747696a44cfd1ed6d3da4bf4d04dcf2c3120a90db6c2640d12a718f2be"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.78.0/xcsh-darwin-arm64.zip"
      sha256 "2983355915a236e201e76f437a6cb9e8c15e621fdbd93f66aae5bdd5a81d1172"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.78.0/xcsh-linux-x64.tar.gz"
      sha256 "0739c9336a7a998947c5bd2f73b0c55c776666595469b7ff1999cdc08f73a79a"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.78.0/xcsh-linux-arm64.tar.gz"
      sha256 "5ba9372f55d1c63309a378be7f0d15c9dcf8038c8488992058970bc6d6920329"

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
