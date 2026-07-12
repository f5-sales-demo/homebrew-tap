# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.62.12"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.12/xcsh-darwin-x64.zip"
      sha256 "8bd3b42c87974dced9fc0d86dded7ef0417fe49929a364d90ae927984b9c8285"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.12/xcsh-darwin-arm64.zip"
      sha256 "43003a4b7a21294650f7593221f306e42911c45d37d68c432fe0e0017225305b"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.12/xcsh-linux-x64.tar.gz"
      sha256 "671d2893b97345990df95b185932442c0fb7032a115cf70085c11cfb081211c8"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.62.12/xcsh-linux-arm64.tar.gz"
      sha256 "eb1b85e5cc7bb2fa3f8a31cd4a3bad83afb3099d4699d6387cddc6565f7e9737"

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
