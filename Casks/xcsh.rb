cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.45.3"
  sha256 arm:   "da47576b7a8b663a8a2758d28aed9643606e6b7273fe5918a62d7be34d21712d",
         intel: "3dc9590e70a8f784021833d7382131213bcc5c0509705aa6014ba5ec9d2e9e11"

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
