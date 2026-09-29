cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.2"
  sha256 arm:   "4406f60e450923ca35c66be4eec29ba564ee8ce41f450ed46dbc28468391a26a",
         intel: "fbc3fad4dc9cbc694bdf1a2993771d01b29576391e1981b3e91673cb15bf2d2d"

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
