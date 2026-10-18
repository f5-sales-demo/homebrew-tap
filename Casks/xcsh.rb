cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.7.0"
  sha256 arm:   "988745c7eb55576eb607d7af9434c0875b852965ba80e48f2105057852bb0b56",
         intel: "011dfa1464b0ff9d836b2ec7ffc25d180115abd7c02ba9bcaad5ef7bd9934e7f"

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
