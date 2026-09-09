cask "xcsh" do
  version "21.19.3"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "1ccd30eb3a4923d223c6f22c8eb578b7f334309e85ae9724b233d370c958319a", intel: "9b21a98090db1147c17562aa95f53bd922807c014c7cd6bb46da10cd171aad71"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.3/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
