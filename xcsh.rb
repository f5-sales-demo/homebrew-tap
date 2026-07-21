# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.70.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.1/xcsh-darwin-x64.zip"
      sha256 "c25fae6a7bf905cc3fd07532a821f029df876283b7a5d03930eacf0cf58988b7"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.1/xcsh-darwin-arm64.zip"
      sha256 "59074bcb748ce85864accef82929d7bc7a5a86b12c0dff253dd2da850cbc79e1"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.1/xcsh-linux-x64.tar.gz"
      sha256 "a1aee3e4f60c23aaabb99e318a09b7509ac02b60d7605cc510122a51465313ff"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.1/xcsh-linux-arm64.tar.gz"
      sha256 "f61c82c065b210af956918637f0e9e8a3b44fe05dff8f9b5877772caa3d1057b"

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
