cask "xcsh" do
  version "21.28.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "292329861bd3aaa876d2a7cf72ab51e026d8bd3831b42ca2499e064ecdc15f95", intel: "a3dda03ca0c29ac064a95fde30ddef5ee8b273abd260df6208c1dbc522deead3"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.28.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
