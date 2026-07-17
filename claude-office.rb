# typed: false
# frozen_string_literal: true

class ClaudeOffice < Formula
  desc "Local CORS proxy so the Claude for Office add-in can use a self-hosted LLM gateway"
  homepage "https://github.com/f5-sales-demo/claude-office"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/claude-office/releases/download/v0.2.0/claude-office-darwin-arm64.zip"
      sha256 "9349d10094ba967648d06b543df6d404e075cf3a979447b83bf16835171d51ab"
    else
      url "https://github.com/f5-sales-demo/claude-office/releases/download/v0.2.0/claude-office-darwin-x64.zip"
      sha256 "998c123778b7bbdf129b5d751d598446c5d56def45b0a82b1fddca3dccf1416b"
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
      Quick start (macOS, while on your VPN):

      1. Point it at YOUR gateway (scheme + host only, no path).
         This also starts the background service automatically:
           claude-office set-upstream https://your-gateway.example.com

      2. In the Claude for Office add-in, open the Gateway tab and set:
           Gateway URL:  https://127-0-0-1.local-ip.sh:8443/anthropic
           Token:        your gateway API key

         The /anthropic path is the LiteLLM Anthropic passthrough
         default. If your gateway serves the Anthropic API under a
         different path, change it (or drop it to use the root).

      Reprint the base URL anytime with:  claude-office url
      Check gateway reachability with:    claude-office doctor
    EOS
  end
end
