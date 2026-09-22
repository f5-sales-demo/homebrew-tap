cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.37.9"
  sha256 arm:   "24a03129de4897e01457917f8c349ce53de6beaf75d13429a9ca8912b75e3195",
         intel: "437c2b84f6eb8b67ca59a82748faae5a800a5855c7cfe62c5ba57d3350bc4ffd"

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
