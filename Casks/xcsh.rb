cask "xcsh" do
  version "21.25.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "2deac52b1720c084357af47ee876428622cf3fb8096bb9f40ba51a1de5d52927", intel: "dec0a38085c4845546611ba5d17c26db38e1264b5dee4d2b25097d34abb6014f"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.25.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
