cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.35.5"
  sha256 arm:   "61f64ced959ddc9a65a7fe8b515c8d19a3a28f2928f6f1ffccf56b267568d922",
         intel: "0fee27b39fcd55336a4fae6ec5797be60e5bb336ac8f963f16d33604f7dc7040"

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
