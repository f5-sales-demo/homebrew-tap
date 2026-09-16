cask "xcsh" do
  version "21.29.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "9378d735c08b6196911a78d38d01fe076fdd16e4704723df6ca18aec1db3e266", intel: "edea41fd6a5ae210bf2c9ba0761ee127c421639d61667189121337399fa5d04a"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
