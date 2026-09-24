cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.43.1"
  sha256 arm:   "9641deefcc059bdcb88b3449c8f6fa9ee10799ec5fa2f4f161a8babe972de45d",
         intel: "7ee3f9ee7ce8be34827fc4cfb434c868ee815d5e071eda4b4d593e71c0187c72"

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
