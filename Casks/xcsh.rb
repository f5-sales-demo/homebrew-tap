cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.9.0"
  sha256 arm:   "987b6309fd39080821ec609de266d16227ba97f657beaabd5428dfdfb1852801",
         intel: "2e4c150cc175f8efebc27fbf879cc4cacf1110ce9e18fa473f438c572c7eba5d"

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
