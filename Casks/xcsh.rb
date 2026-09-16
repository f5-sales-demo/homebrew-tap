cask "xcsh" do
  version "21.29.3"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "ecaaae7bb0db661c1c30f18f3bf53a8a39b8a93c1b1017480e9ee5990ab886b9", intel: "e9b58f372ff7a66e68e80a1d00ab052d31f1e467d63a43a93fb85d9cf8a259c9"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.3/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
