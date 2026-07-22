# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.74.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.0/xcsh-darwin-x64.zip"
      sha256 "4454b1f1ff2afe57b2849d5859ba329221e02230f7a751b35fdd565f12fbc293"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.0/xcsh-darwin-arm64.zip"
      sha256 "6453318713d9f1b6d93aaf494d3428b81586c2999d6b6ea32d44e4d11953965a"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.0/xcsh-linux-x64.tar.gz"
      sha256 "99cf3034ca21454acb28178ffda654c4b84648951633da3dd7c266f35dd3c052"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.74.0/xcsh-linux-arm64.tar.gz"
      sha256 "ffd0be5083c40359b4918e1e64b94ec59a51ca4b9468d9f520bf14166bc0e6d3"

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
