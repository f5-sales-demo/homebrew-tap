cask "herdr" do
  version "0.20.3"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "81a252bd55bcefe2cccb5762e15d58527671577c14e89510a21a229edee94921", intel: "6c9d038019c6e1ecab36349f4a11c36497121e62405718e788d24b6967d3f54c"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
