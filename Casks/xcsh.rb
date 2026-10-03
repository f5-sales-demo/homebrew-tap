cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.8.2"
  sha256 arm:   "61b2a73f896da570410142807766630fa998f01fd3004ac029fb1f3e8ed95d77",
         intel: "d84e7b9e8d82a8fa334db653a862d2d862ef614924b541f5a849ad88f5d58d1b"

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
