cask "xcsh" do
  version "21.12.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "6ad317a1bc0e86b9bb084ea442adda666e2bb95d33f0edd9d8298fd227674749", intel: "ef1bd313ef42f0903d99e75098f9d127a36bc06dd735917fced70baa80823331"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.12.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
