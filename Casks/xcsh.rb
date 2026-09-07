cask "xcsh" do
  version "21.16.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "2c721499c3ea74f5e03636d5b104426a1dd2d41e406d8a6bf0f88e7ab45af56b", intel: "e35c64a3e1bb218a04c065becb81b2ada065478e4a8b944b546e527be627593a"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.16.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
