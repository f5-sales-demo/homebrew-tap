# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.76.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.76.0/xcsh-darwin-x64.zip"
      sha256 "928b189918a6db5545643e163e0fbc219eb8f101b07f5932f6399729cd608e71"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.76.0/xcsh-darwin-arm64.zip"
      sha256 "0c7e9b2ad78d7c1f9df83cfefc981c2421bff7ebb4674f7c1de2b174f8ea24e2"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.76.0/xcsh-linux-x64.tar.gz"
      sha256 "b98e6e06e9c2bcb6e636b796c58133cc3dacc2f294fae180c44b32c51e5115eb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.76.0/xcsh-linux-arm64.tar.gz"
      sha256 "64a78b66f1990118a3dc347f3451b26ccbed765f92714521b6113a51bb921b0a"

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
