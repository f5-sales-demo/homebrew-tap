cask "herdr" do
  version "0.17.0"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "7b116e7bf0981c8138d0b889699155f28772afd1e276ace023f11746c9a9a2a1", intel: "b683ef39d68281db0d7e5215bec99ac757eca9d831c6e86ecf3334deb1251249"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
