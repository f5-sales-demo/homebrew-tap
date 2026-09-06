cask "xcsh" do
  version "21.14.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "0dd6c2a969c6fc86e0dcb289e18e1185ee0eae629a67e1ff5f301ad3b943e521", intel: "a19c1f4d15520ed34f1ca647a7a2ea99395ef9dc9b0b40b32bf9942951cd03ff"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.14.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
