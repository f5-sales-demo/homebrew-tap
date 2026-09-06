cask "xcsh" do
  version "21.13.2"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "bc4d43e9086caf595f4607d8e5e97541912fa2fdd306f77b81cfdbe00d1f662d", intel: "6cadfba3b66c3311eab572ebcacebfe08b40d7ffde312016228abaf78be12f64"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v21.13.2/xcsh-darwin-#{arch}.pkg"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  pkg "xcsh-darwin-#{arch}.pkg"

  uninstall pkgutil: "com.f5.xcsh"
end
