cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.8"
  sha256 arm:   "2aa12f3d6139d30fe470239784e29fed12ca683cd1ee1c5d0cf499c8fad3b31b",
         intel: "da3e83d096b1c5fbb3521bc862a7ca1306a7f7b5a0fd356412fd2f0f34f86a1d"

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
