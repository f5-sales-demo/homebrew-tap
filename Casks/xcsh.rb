cask "xcsh" do
  version "21.19.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "bd85b7b78d83c9d433be8525dc0f10f77bc44cb1b082c91d3be07917345e80d9", intel: "c01fea1991cb3a85fd0d732df80e52d6f5f24c8d46ad276c0c6b72341ff0907c"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
