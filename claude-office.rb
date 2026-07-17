# typed: false
# frozen_string_literal: true

class ClaudeOffice < Formula
  desc "Local CORS proxy so the Claude for Office add-in can use a self-hosted LLM gateway"
  homepage "https://github.com/f5-sales-demo/claude-office"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/claude-office/releases/download/v0.1.1/claude-office-darwin-arm64.zip"
      sha256 "4d188ed531dc5446030755d75f593f75894fa08e1aff19e00dcceb6cdaa68d08"
    else
      url "https://github.com/f5-sales-demo/claude-office/releases/download/v0.1.1/claude-office-darwin-x64.zip"
      sha256 "89d69b679f4e455603399d775f0436bb75b4425bb5a40a13c463818a7f7f48c0"
    end
  end

  def install
    bin.install "claude-office"
  end

  service do
    run [opt_bin/"claude-office", "run"]
    keep_alive true
    log_path var/"log/claude-office.log"
    error_log_path var/"log/claude-office.log"
  end

  def caveats
    <<~EOS
      Configure your own gateway, then start the service:
        claude-office set-upstream https://your-gateway.internal.example
        brew services start claude-office
      Get the add-in Gateway URL (must be on VPN):
        claude-office url
    EOS
  end
end
