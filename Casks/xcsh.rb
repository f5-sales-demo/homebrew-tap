cask "xcsh" do
  version "21.15.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "f4e185e9a3f1ba0b0c9fb137c30054888ea67f11a365283ac23b1f538a4079aa", intel: "1534577dc45981d79c2000a05d6d3fa1316cc57ba7486c2bd208c3ecd5058063"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.15.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
