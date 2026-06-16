# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.32.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.32.1/xcsh-darwin-x64.zip"
      sha256 "cabb64cfe35f08b1b48ddf40b91dbc54c03756cf054fe06825273b089bfda677"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.32.1/xcsh-darwin-arm64.zip"
      sha256 "07d650234bff8ddb54988553163ab74ed557b4e1ca2457f52dd843befe795c2c"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.32.1/xcsh-linux-x64.tar.gz"
      sha256 "ee8794dc240f8f73d6f3d42864e83d5f348771aed2ecaf35761b66c2022838fb"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.32.1/xcsh-linux-arm64.tar.gz"
      sha256 "0128923be5f70eac81a33395356f96211017c3e78058eaaecbf5a3eccbeb331c"

      def install
        bin.install "xcsh"
      end
    end
  end
end
