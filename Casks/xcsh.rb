cask "xcsh" do
  version "21.20.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "4bc5279a2a05275bac1a22327a0f87f0e9cf376fb789d1bb91677b10a8ddec71", intel: "13814fd8b69f5d27c2c5e478664a19c6f495bfb7dbe4e62bff3d4fcd1b834bd3"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.20.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
