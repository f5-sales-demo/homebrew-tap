cask "herdr" do
  version "0.19.0"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "59639e699e332db8a3dfe5c8c2a3b2c0c2367543f2060b5ad9974ca7489b5820", intel: "91bef4e706cdb09784f592d1e2e303b66e55b81e098031f37cf9647e420cc967"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
