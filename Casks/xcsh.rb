cask "xcsh" do
  version "21.24.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "74e2d78082cd0e3a4e52a1e8d628302f56a2c5169732a4e359a13d638a757d54", intel: "5b49dec1242f8e01bf55c4069a9667ce35317b5898928ea23cd631bb1dae1123"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.24.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
