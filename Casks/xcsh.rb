cask "xcsh" do
  version "21.29.5"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "76d0232f57d99a1bbca17bc822aaf0576a9a1830667d6407d50a4c553cf12227", intel: "11b2fa26e4f5cd64931365cf735849272930e24095c2e94b6c3ba5136844813c"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.29.5/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
