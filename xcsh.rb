# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.81.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.0/xcsh-darwin-x64.zip"
      sha256 "a41e8c727e0929f276a919aa9c0e5eb798d963b63ebaab2284dfbc488a7c17c1"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.0/xcsh-darwin-arm64.zip"
      sha256 "0faaeb0aa26709f8c6d6e0834c319ea6b5640647ce0b88f0a99370879bb37659"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.0/xcsh-linux-x64.tar.gz"
      sha256 "476efdb0083d580a9068ec24f9e7661a2a3a73a2d72aa33f9659419f2b81b37d"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.81.0/xcsh-linux-arm64.tar.gz"
      sha256 "b8cd3a48480df99c31332a4f70a94de6dee2658a986391497fe51c120df26869"

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
