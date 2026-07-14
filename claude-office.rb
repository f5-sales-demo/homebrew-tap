# typed: false
# frozen_string_literal: true

class ClaudeOffice < Formula
  desc "Local CORS proxy so the Claude for Office add-in can use a self-hosted LLM gateway"
  homepage "https://github.com/f5-sales-demo/claude-office"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/claude-office/releases/download/v0.1.0/claude-office-darwin-arm64.zip"
      sha256 "6486ee8444196c9ffaf6149df444ca6416ec9de440053ee63c4d0ea2dc4b541f"
    else
      url "https://github.com/f5-sales-demo/claude-office/releases/download/v0.1.0/claude-office-darwin-x64.zip"
      sha256 "291899a07ca05bbf5946451be6a5228db191d192c7a2ce983c9c23749b514f05"
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
