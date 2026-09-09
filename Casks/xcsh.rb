cask "xcsh" do
  version "21.21.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "d45aa2da24ef5ccbb8742f5c947fdf59c941763fb29135aec91a3be446a0b5f2", intel: "173991876bc19545368527c9eace837b9e2702a8eda0cb4ce2d8f2b0ad768084"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.21.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
