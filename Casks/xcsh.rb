cask "xcsh" do
  version "21.11.9"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "68dde2a1e95e643e143b5b9c92210041b1d46f12c81f56a7ff725cb95b74baa3", intel: "72282e3cc22d358fad70b87a98e3c2a2788bcdd7800261a78f7af40c28b8a713"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.11.9/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
