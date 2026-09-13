cask "xcsh" do
  version "21.28.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "e3478c58b1b14e04ad78e985d3f64e118860a25a6174a6151d5a981aefc76033", intel: "0e7c182ab3fab9e36db7a2572ed9d7f3c60f21ace895518b85adfc22c78a564c"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.28.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
