cask "xcsh" do
  version "21.21.2"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "b3c7e4b48782176246c3fa0a6e387f367151650745087c72dcc7782e53ac0d71", intel: "7fe32c23eab3397b6bc182cea6bd3f23926b322c4e36769bbd20def3cefd6bf4"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.21.2/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
