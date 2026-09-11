cask "xcsh" do
  version "21.24.4"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "f3b2cff3cd2517d217b7a96b5467c4ba7412fa99e5ef56ed1f6ce6e311c588f3", intel: "8971f1107db4f09c87441c30912fde2509b98ca2659a68f8f6855b4d33eec8b1"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.24.4/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
