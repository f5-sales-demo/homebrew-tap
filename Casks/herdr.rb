cask "herdr" do
  version "0.16.1"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "b7cc89ce9b899e5500fb3dad6d74884792dd85b46dcaf49b36d4c37b8d30416e", intel: "6cec2b6f0180159c0edc18eb515276245667f21bf8ddb04799e7b562ebc4ee35"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
