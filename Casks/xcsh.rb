cask "xcsh" do
  version "21.29.4"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "dae43ed8f792aa8720900a6fdcb4458b08e00030ef0141a0cfcd1d5f00e2e48b", intel: "cbc0dfd78ee22067b4f97c4f1dc84e8f9387d968dbeee7cacfafdea9153b7ed8"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.4/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
