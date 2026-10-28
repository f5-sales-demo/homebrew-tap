cask "herdr" do
  version "0.20.0"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "6316336619d99e4da2ab0d6dc135fe529b07d041f47405f399666f81e68b34a2", intel: "2600d98115eb98b2fca3a50709deb20e971939ce75030550fdf2ddd506653387"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
