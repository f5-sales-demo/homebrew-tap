# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.74.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.1/xcsh-darwin-x64.zip"
      sha256 "07441fa6c05e399c6e74a73664809bebaf243285ea9ce2b2d89d5bd3d95c8d84"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.1/xcsh-darwin-arm64.zip"
      sha256 "f98d38263c94158a302d200330dc7dc77ad05f2d88467eb643c8cbf0054b9145"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.1/xcsh-linux-x64.tar.gz"
      sha256 "ea8e509a003e2836d73055eb34f49e95b75c8b470779b8983622a519914492fe"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.1/xcsh-linux-arm64.tar.gz"
      sha256 "653a7d0c6e468f27f372928782db04f9b2d6fdf1785f0e05e0988948a3dc6103"

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
