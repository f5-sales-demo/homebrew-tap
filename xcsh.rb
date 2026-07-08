# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.62.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.2/xcsh-darwin-x64.zip"
      sha256 "6f8ae566d3ac68366fd9921dea3a02aa912825f56415d213a5e8ee8354f384ee"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.2/xcsh-darwin-arm64.zip"
      sha256 "a0421885728099bef815c6dfca3bdb47439cc50ef2a97a8df2f8c8ca4051b86a"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.2/xcsh-linux-x64.tar.gz"
      sha256 "173e689f4ceebcec9cc56250e65fea56b7afc1d0cbe132e692d77d63bff6fb6d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.2/xcsh-linux-arm64.tar.gz"
      sha256 "37fea4f5294d1412b1f4c4b91599f685a8776006a0a3d57fb54fecbfe80eaa86"

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
