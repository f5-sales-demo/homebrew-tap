cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.8.3"
  sha256 arm:   "69260147d0452841101f0d177e69ec381994b458186e9e888e74b18487ae3a10",
         intel: "47281608b426666c15d7f776fb3aa7942ce1a5d66c8ee67a82f7b24923b18e13"

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
