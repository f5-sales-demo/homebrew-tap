cask "xcsh" do
  version "21.29.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "927ca0f29023a9ba8723a460cd99fa7afd32f8f6880ff99d6ca29086879c0ada", intel: "587294fb9edd8f1611f587049f3fbf9b5e4448439e56b29cc9eec703ac0ddabb"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
