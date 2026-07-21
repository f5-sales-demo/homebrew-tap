# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"
  version "19.66.3"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.66.3/xcsh-darwin-x64.zip"
      sha256 "0ebb531d3f2600f70039873b2dfc20c54027b4c7342094b4a52c6a7cab48094c"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.66.3/xcsh-darwin-arm64.zip"
      sha256 "f637aba1dbac269dabd2fff79d8d3a49cd7c724fd03c9c5cddbefa668bc4f1d1"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.66.3/xcsh-linux-x64.tar.gz"
      sha256 "a271601a06fe5c3f7d37d004c06eb616707b0bde4b6cb5b69d26e3ff1859ba99"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5-sales-demo/xcsh/releases/download/v19.66.3/xcsh-linux-arm64.tar.gz"
      sha256 "51d11f054cd75c8499c985471912ee3077c9c1020e92bc96c9c7204bd8000427"

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
