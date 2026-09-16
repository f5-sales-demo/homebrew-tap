cask "herdr" do
  version "0.16.0"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "83b69d855f4b2ee2c63f05e5a8b05edbb6e1657ef0a7903a8fd9788a7fe2fb52", intel: "13239490bf206607b96fdea22e794b2dabe5ac2edbef42251a0bd9146b0d3705"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
