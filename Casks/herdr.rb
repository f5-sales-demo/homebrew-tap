cask "herdr" do
  version "0.15.7"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "08c98a2ffedb9d0a9aaa3a11f07f081073179b68c84cba1fd27e847738a66c11", intel: "3f1ef3186da9ad4b17096fe2dc0ae7c1962c509f26c8a20e77af021e158dee01"

  url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-#{arch}.pkg"
  name "Herdr"
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"

  pkg "herdr-macos-#{arch}.pkg"

  uninstall pkgutil: "com.f5.herdr"
end
