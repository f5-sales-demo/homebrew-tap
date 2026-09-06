cask "xcsh" do
  version "21.12.2"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "832cf2b890cf93ff647593adb001e3028d971be72e33ef7cb81a260f210c2ec4", intel: "d5383bdd95bead270611da93a280495628340085ef000dbb4a72740836c73a04"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.12.2/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
