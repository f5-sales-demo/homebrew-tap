cask "xcsh" do
  version "21.19.2"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "f8dd7b03eff0fd98d67b54a8ccc91bac4242f397b7b13bfa712e32af7e49cb18", intel: "9dbe47d35b9c64319bc7845713405fdfa6dba3d520ce3cd315d8e33d96035458"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.19.2/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
