cask "xcsh" do
  version "21.19.4"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "cb3c8a02627be1c0700d17bf9e045c8203132cd30db310f46d4b4caade2ddb56", intel: "36dd9c395c43588e0e3506631c0d75c11c584a90aaa2dea6040d1f5776b9400d"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.4/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
