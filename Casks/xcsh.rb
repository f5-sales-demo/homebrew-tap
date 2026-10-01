cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.7.1"
  sha256 arm:   "0b579a52d68bb90a432abee00beeab19760215dd6a66768fe1c9204c77351e6e",
         intel: "79e0911f63095f3ef9c9c87adb954c5a72aea998511e9b33f7b1c82dccca59a2"

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
