cask "xcsh" do
  version "21.30.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "adb3e35d0a02936dedf0f0febe27b414699bc55dd0da7dfa031b2822090c0e85", intel: "91542169e060bdc070420774305505eed402bd1c81f67eb2d78d632ecfd64096"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.30.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
