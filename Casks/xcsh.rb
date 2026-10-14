cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.4.1"
  sha256 arm:   "62df92ecb6c7f5333a110497f9f9d3bc8bbba007b2f585236de3325b8bc04861",
         intel: "ce2db0f162ddb8c6670847975003da32c930bed3027d266c290f85f3a10fe9d2"

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
