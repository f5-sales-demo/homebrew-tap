# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "21.9.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.9.0/xcsh-darwin-x64.zip"
      sha256 "386b734ba35f93eb74c4a7d1b3cb90bba8f0d28d93daaab29f6a8700c32be9c1"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.9.0/xcsh-darwin-arm64.zip"
      sha256 "b2ce59d500b229ad582bcfc227163e6bcb53c799a685a777ae3d06e873e8cf34"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.9.0/xcsh-linux-x64.tar.gz"
      sha256 "486274948e2c7a857d946c7e146e7e5b2897fa4fc3be6ee0d941bd55ca6f3224"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.9.0/xcsh-linux-arm64.tar.gz"
      sha256 "ababd0d9938eec5fe8af1448edd4e5f6f916a50c233085a263eef3baacff24fd"

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
