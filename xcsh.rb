# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.63.9"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.9/xcsh-darwin-x64.zip"
      sha256 "05d80b6870b2787436eb5fbc257c318347386310c47532cf5bd41e57a93805ab"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.9/xcsh-darwin-arm64.zip"
      sha256 "8d6c07a272b4ba4549a14c870c0285c0f9cd7cf613797ffe9a16ff7ba759279b"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.9/xcsh-linux-x64.tar.gz"
      sha256 "8b2ed71d0821b714f9979b65d52d925f20730b85aa4c9ae718b5f4355d011cfc"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.9/xcsh-linux-arm64.tar.gz"
      sha256 "656a25e58ab006e0431d879b9217ffe3342cfcb75084f40ee26c9cdc1454574d"

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
