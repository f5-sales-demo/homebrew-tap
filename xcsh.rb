# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.63.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.1/xcsh-darwin-x64.zip"
      sha256 "cdc9963f82b98f41486af8d112fdab8767cee9a761f4581d565cfeea77197420"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.1/xcsh-darwin-arm64.zip"
      sha256 "1f0b91f381609c55a8345547332c8b5a9a6b6a51c67b408c0abd65359e894e55"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.1/xcsh-linux-x64.tar.gz"
      sha256 "0478f681ac75baec73b181778ac3a35114c84aae36cfcc62314449ea5eaeb4eb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.1/xcsh-linux-arm64.tar.gz"
      sha256 "74c8ee9ec41afb057a2ce1fd0b5f8e0b4e3ba6ec4be408e5906d76c9a18bb4e3"

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
