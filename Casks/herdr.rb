cask "herdr" do
  version "0.19.1"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "97932c5c7ce6c155215d336830d84f9a20b4f991065559fe2cf872a0654eabe3", intel: "87cf6f8c1c8381453c77e18d8c2e63334a87d6da755cb391be331543dede0c78"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
