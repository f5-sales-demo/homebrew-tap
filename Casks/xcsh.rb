cask "xcsh" do
  version "21.29.2"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "6b40bf9b1b0e3c5b5cffa2acf65b79e3f6b1d16febad420bb4120a8a0563cf16", intel: "676b4a8ee93957ee70bfd595dd2605fa93a285c842c861f47217827c53765be0"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.2/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
