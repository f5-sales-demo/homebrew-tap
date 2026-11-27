cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "25.1.2"
  sha256 arm:   "9b71b4bc91152557a3a5d5b7259e04d66ff56ce8f68f781ae5f07d66d4f1b511",
         intel: "4a4e1b6237479b972a803fdd839e0a365c81c964183b2c8fa181a1050d6aaab6"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v#{version}/xcsh-darwin-#{arch}.zip"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  binary "bin/xcsh"

  postflight_steps do
    run "bin/xcsh", args: ["chrome", "recycle"], base: :staged_path,
                    sudo: false, must_succeed: false
    run "bin/xcsh", args: ["office", "recycle"], base: :staged_path,
                    sudo: false, must_succeed: false
  end
end
