# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.63.5"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.5/xcsh-darwin-x64.zip"
      sha256 "6d1ec4895e200eab4e8b9b83994577cfcaf9679e03dd92924c8a38ade37cfc24"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.5/xcsh-darwin-arm64.zip"
      sha256 "a7555d327388098458b1e8a2b6d0a986e8ef2b4223d075c400b70242e6a952b1"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.5/xcsh-linux-x64.tar.gz"
      sha256 "19d8c257a6f4eb2e52b089d10da2cce6469f80e4424113bb093f64f7f1c4accf"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.63.5/xcsh-linux-arm64.tar.gz"
      sha256 "d2acdacddcd2381e8781fa4547ecc195149132eaf818e4a9364310bf6fc2a3b0"

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
