cask "xcsh" do
  version "21.12.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "a6f6d6a42439f2312b94b6ee70fa94be38b5727a43faab31dddd60415625d3c6", intel: "66e6398c3529267036a646ff5edf336d0b3bb7efe9d93bfdcaeaa2d19dbe5ad7"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.12.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
