cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "25.1.1"
  sha256 arm:   "2791ce333da3c29d9248a3122842ed40a187584a6375d81bdcc74e0a1ce7967b",
         intel: "b8e5c8246f4c624ee3d20dfd0d781e297cd116391e77cc4166223e03154e394f"

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
