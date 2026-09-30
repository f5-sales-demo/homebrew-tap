cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.7"
  sha256 arm:   "2ba6d1c5cb8712313132d1e03382b314aecc03d743592ce616d147e9c7e12d09",
         intel: "f35080778554f44dfda003f4c260537d64ac34787b726dcc1c0fa08a1f94cdc1"

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
