cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.0.2"
  sha256 arm:   "8d98decbbe38b9e0d03a36c7e08a928622a5f0b0361e162ecfb8408fd913541a",
         intel: "e05f3588b97ca6488f6269d1d9388277c1d0de81c7e2d9d729896a44f78cd606"

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
