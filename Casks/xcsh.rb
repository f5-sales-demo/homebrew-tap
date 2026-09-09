cask "xcsh" do
  version "21.21.3"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "ccaaeb37e1a14d3e4236e188e583b0aa19bdeba0df547df8eaf2d05b5e30a7b8", intel: "e3f8b683034a3c7240528d875ef0bf6bbd5aed0b10a14ea2e92a25573ca4df94"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.21.3/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
