cask "xcsh" do
  version "21.27.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "eba6637d514a8605f56bc84058b097f2feac7debbf3dcb91feec3358dbfa8a8a", intel: "bef479b0795eb3829e4d91a80c63fc996f03ea69650c654f22419bb56306aade"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.27.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
