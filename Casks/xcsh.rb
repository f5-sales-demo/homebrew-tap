cask "xcsh" do
  version "21.13.1"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "dfbbd2435c90246bfae32ee554f3df62576954da4c968bbdc8fd47d8964379f5", intel: "02697db7d3ae4f19e16314e70a37ac24913d4c561a0e1e157dcfefc7a34369a9"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.13.1/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
