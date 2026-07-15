# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.63.4"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.4/xcsh-darwin-x64.zip"
      sha256 "6605e0e2f701bcd540820439d4d02cdf70e8b86cdaafcbe3c7dfeccbf34233ed"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.4/xcsh-darwin-arm64.zip"
      sha256 "6ec6a842a0266571b93601b8cfebf93f33fd789fc9625bf498d0785151bf53b4"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.4/xcsh-linux-x64.tar.gz"
      sha256 "679b560f00a3b571213cde6f5ee4d9ecbc7c5acaa9bc031d8621e6c96f1ffa5e"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.4/xcsh-linux-arm64.tar.gz"
      sha256 "794fc519901b37e1d2e95fa5a58457d64f86cba73fef1525a39a5e8f88e4612c"

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
