cask "xcsh" do
  version "21.18.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "bb47163b1c77a2e361f942e838ace00d0c12c790023591ccd4b1f1255f4cda96", intel: "418a5b0c7b23a31de37466e85fd63259a324d2cb2f53c91f69f2dd9f4cdef5e0"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.18.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
