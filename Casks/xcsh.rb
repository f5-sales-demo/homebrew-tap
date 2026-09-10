cask "xcsh" do
  version "21.23.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "7014c076898b09c9d1dad1b1faa9f652be08f8da5af5e6de0e0ac11eaed25f8c", intel: "df9984027fdecd71ca40a39df87006b286d86138168a4bcde3d318b04bd9f41d"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.23.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
