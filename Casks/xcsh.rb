cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.14.3"
  sha256 arm:   "7ad2bc69a7d68d0b601d56f2cf785e52a31ab718117a8be16d2c374f1daf2e9c",
         intel: "1b44087b8da5266201a02eb25893b925e903cb45537b7f389374bf352470ef54"

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
