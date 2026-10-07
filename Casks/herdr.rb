cask "herdr" do
  version "0.19.4"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "79abebb26130693cf8c88dc88fb3b5ed4deeb4bc2075f49a13350da6dd1500cb", intel: "92c13b240fbd881dc272c84ab268e3673c5f18b2b7814fa2fdccb3c487ed5c7e"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
