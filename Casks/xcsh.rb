cask "xcsh" do
  version "21.17.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "9f4dd8d0abc6829002c505ccafdec1eda63056e6e0fe1da85c0286cb4a36620d", intel: "f12d2d329780ed12abb871955c342a35a5589341b6d6de16e152c65b7df33737"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.17.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
