# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.70.2"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.2/xcsh-darwin-x64.zip"
      sha256 "d26d1af851ec3738154bbe487b1dfdec1172f49fa8cad745089137886937ca5f"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.2/xcsh-darwin-arm64.zip"
      sha256 "dd013167491289363ffcc2ac4a2a743b1f457a9542a5450f047c5b5a35d47903"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.2/xcsh-linux-x64.tar.gz"
      sha256 "366b5bea0dc6a59c5cc3bea9e29a90f5c2b4046090de19a07578fe62b33e01eb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.70.2/xcsh-linux-arm64.tar.gz"
      sha256 "3eaca7eeedd8273b5ceb2060d10ba3f0f8c902f883f2e27ed1ffc30121dcaa51"

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
