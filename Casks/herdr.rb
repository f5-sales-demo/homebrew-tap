cask "herdr" do
  version "0.19.3"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "0c0327e8baacb41d469b61ce0b73e156068ee67d6258df8fba86d07cdc1f186e", intel: "1b176107cb7929e033c2e7128aed7df6f0d81170d432c117e9b2d02441bfd663"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
