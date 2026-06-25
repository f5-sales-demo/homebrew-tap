# typed: false
# frozen_string_literal: true

class Xcsh < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5xc-salesdemos/xcsh"
  version "19.46.1"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.46.1/xcsh-darwin-x64.zip"
      sha256 "97d8fcb7e633eda7103cc59916f261d95f6244f584d5e9ace264052808e3547b"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.46.1/xcsh-darwin-arm64.zip"
      sha256 "b46a1479cdd000c185e21b995bd97ae09b93badc342d9ebb038aab81b8baeead"

      def install
        bin.install "xcsh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.46.1/xcsh-linux-x64.tar.gz"
      sha256 "a7cb9c27e86fd82b832a93296e9a960052c0de822e89d12fd559933192e69276"

      def install
        bin.install "xcsh"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/f5xc-salesdemos/xcsh/releases/download/v19.46.1/xcsh-linux-arm64.tar.gz"
      sha256 "38284fe6b142d7c3a74fe2ec8c0c279860563ea464ad36bb20a9f4f097e3daa7"

      def install
        bin.install "xcsh"
      end
    end
  end
end
