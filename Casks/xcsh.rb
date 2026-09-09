cask "xcsh" do
  version "21.21.0"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "d074b59411e7b93ec87da8ea5b59acfe4d9d1ee55fc6a98135c3d8ed67dcc9c0", intel: "1a3c83f585fd436b2232c17fe58f3c87521e50f0b9835be0ff4b21fb4eff2391"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.21.0/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
