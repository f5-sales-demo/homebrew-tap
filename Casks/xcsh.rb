cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.45.2"
  sha256 arm:   "04b091a44bcedb98061537c2a2e7fc20dee1bc3efe5ed3f9be3b78ed7c9d5791",
         intel: "318633a0065be7855c43f4e9a71ccbacc8e176dfa3cf1d96f0f501e69b3d1ea5"

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
