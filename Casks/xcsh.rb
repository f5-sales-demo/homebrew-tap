cask "xcsh" do
  version "21.14.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "1f4c33ac052b36096647e9180cf98b32bbab56928375291db0a83c3c5924372b", intel: "fc7c923c97b36523cc140fa3cfe852dbdf1a969aaf8045bcc7cc19be94cb0f8a"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.14.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
