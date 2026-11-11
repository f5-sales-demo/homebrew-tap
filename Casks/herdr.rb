cask "herdr" do
  version "0.20.4"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "4ac5cbd5bfcecc97a572005df17b89922c138c8eef6f151eca0d8a2dce45f326", intel: "45c92547670efab6557ca0fa7ec7aa32d0f5bba6e5269486fae72eee86c57b17"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
