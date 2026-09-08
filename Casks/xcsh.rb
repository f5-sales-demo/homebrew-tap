cask "xcsh" do
  version "21.19.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "015a81e1e140f542f97f9a169d9d95e58e57c087c52b54a24792259e934129cb", intel: "b484ca5b3064ba3c88f74e7887354c3f7284458fdd7d7cca10bd7473e83682d6"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
