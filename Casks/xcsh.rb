cask "xcsh" do
  version "21.13.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "c0f99cef038d619664d3962e93355db0cea145e1a7f652e9be70ea1441f4fe97", intel: "4e5912bfbb6420b111f21ea61b06f80428618dc23ad38dd431b4470ef383a222"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.13.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
