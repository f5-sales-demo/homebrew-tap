cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.14.7"
  sha256 arm:   "2c9813165c548214e36d64830229a5aee2d59bb57abe54f325b2c6ca171d8e09",
         intel: "93731d35eccdaeae90d24dd38194933ebcd9314d0189b0050a7a0df870bbb647"

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
