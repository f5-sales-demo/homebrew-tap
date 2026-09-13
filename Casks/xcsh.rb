cask "xcsh" do
  version "21.27.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "75617c56c50f54397dff8618f5bdd53617147bd6d3de99a88052f6b7f2ebe549", intel: "797628b24010840883ac17491b00a0acbb614f21a211162f3b328dd698fdaf03"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.27.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
