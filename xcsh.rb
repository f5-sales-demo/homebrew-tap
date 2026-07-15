# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.63.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.2/xcsh-darwin-x64.zip"
      sha256 "023344489350a7495ff87feee5598911937e795468f0ce39dc2a8ac75f4bbe79"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.2/xcsh-darwin-arm64.zip"
      sha256 "9ab29006f2b765cec2e0f0f9b9c2c48cb9e9be5925e7a077fd0584d6751d4d12"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.2/xcsh-linux-x64.tar.gz"
      sha256 "2e8d9234bf3f20af04f482089c3c5bf8708a5ec3454435d36d5bd8b42724ccc2"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.2/xcsh-linux-arm64.tar.gz"
      sha256 "121d940f2f337a1f45d84bf8d6cb332a1508acc92226f0d8304558545124eb46"

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
