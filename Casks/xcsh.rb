cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.47.2"
  sha256 arm:   "0b4fc1876cccc9de4c049bec1855e3f5ed6df109a8c4ef8dcfd3ed748835fd2c",
         intel: "5b95efe8d59a8c9b8cfab141c5d8a8dc120f6c026bafd86e86bdc603e0efbd5f"

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
