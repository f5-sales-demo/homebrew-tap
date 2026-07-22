# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.72.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.72.1/xcsh-darwin-x64.zip"
      sha256 "c9f112d72b0b15e8d6b79cea80d51a0c8c30d342b69ed646da1bbd3cebcd5d82"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.72.1/xcsh-darwin-arm64.zip"
      sha256 "3da0e49c70345aeafa9cd04365ce8b6bde806f49e1eb3a7b715383c5e8ad69b7"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.72.1/xcsh-linux-x64.tar.gz"
      sha256 "7b92099412d2ac12594869fa80f1b366f4f2d3323d156256e255ea37b7a429dd"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.72.1/xcsh-linux-arm64.tar.gz"
      sha256 "ec4cacf7b3ba0b182b9584e837320eaf347dd90c96bbb207e1afd6defe6fae00"

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
