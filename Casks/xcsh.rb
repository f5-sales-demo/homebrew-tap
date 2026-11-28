cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "25.2.3"
  sha256 arm:   "e0de30c9e9f24123d2d5f430e51f8ff7f88a92969fd9cb2bc504fefbb295a4ef",
         intel: "cd03d40a49bd23079ab8bfa3f6f28fb4f50453656cd60407ab906d4a43817e71"

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
