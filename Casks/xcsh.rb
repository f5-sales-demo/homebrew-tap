cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.4"
  sha256 arm:   "610fd7af25e2e4dedadec2392b79c9dbe2190da51c6a7545b3e99067a41a7881",
         intel: "ea5742ff97d8cd65961aec996d7699309c85d0df216441413b1127c0155c21ac"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v#{version}/xcsh-darwin-#{arch}.zip"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  depends_on formula: "ripgrep"

  binary "bin/xcsh"

  postflight_steps do
    run "bin/xcsh", args: ["chrome", "recycle"], base: :staged_path,
                    sudo: false, must_succeed: false
    run "bin/xcsh", args: ["office", "recycle"], base: :staged_path,
                    sudo: false, must_succeed: false
  end
end
