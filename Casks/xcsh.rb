cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.6.0"
  sha256 arm:   "54f9ffb967f9b8efb0fa411780bf2e4589647069befd03ecba0e00d8be76081a",
         intel: "bebf1e0d0a16201d7b1cdc2cea52b718203dde8b6399e15cba520ea15bc78348"

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
