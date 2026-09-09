cask "xcsh" do
  version "21.19.5"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "051d2c221c304c2ed33c2a4539da826cd588a57ea181ab4b8e846f870c27aa08", intel: "f9c61fb4725020a58c67cec477c766300091453527a4b3d79b92ed2a34a9b97e"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.5/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
