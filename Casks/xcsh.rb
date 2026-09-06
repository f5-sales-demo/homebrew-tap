cask "xcsh" do
  version "21.15.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "931d11ad664d9ae6586624b26bf500769b907025a89e124bd89d02aea4686b9d", intel: "747b2ee141031edacfffee6a3d8e56f196195dec773fe618b6c968f1226153d8"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.15.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
