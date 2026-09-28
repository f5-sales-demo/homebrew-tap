cask "herdr" do
  version "0.19.2"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "1e6eb63edf9e05859e82b3822a0bcfc4868e836f21562fd9249b244b12e45753", intel: "1a38769bbf8831c059e0b68e9f56697b9924844fb48a2ff0975844d7fd3e6fd8"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
