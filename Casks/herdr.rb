cask "herdr" do
  version "0.20.2"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "34374af172be50bfe520cf7b3b4c0ffc9967f7d9f8f588c686fa0d4a911a3178", intel: "f1bcbfa5823c711ff9145f4678b5ab8fe7b169494dc176bfff74683005ecf063"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
