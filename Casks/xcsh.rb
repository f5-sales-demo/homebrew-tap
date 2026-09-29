cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.0"
  sha256 arm:   "3eb2b6682ef26aac420f8735cee18a6aaf3e8be4974d732e6fc9b07c6e917796",
         intel: "85f6cf4b09971ad3e5d5ced600ae011ff9a9bae6f1cdf4cfd4d422c8e2f8e6f2"

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
