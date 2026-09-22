cask "herdr" do
  version "0.18.0"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "bdf37f26cd9e4c69df58362c06679c62d46483b481626becc0efcf45a27f5be3", intel: "5ee1bf8558d6fcd170cfc6052be8093ac4877ac6f02c72027450b8a24c135ceb"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
