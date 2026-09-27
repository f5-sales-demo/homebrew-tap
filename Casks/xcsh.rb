cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.50.0"
  sha256 arm:   "94cf8c03e16d8dc4b1e9f2abd0b843c56442d1691354b3446879dac4791fa0d5",
         intel: "cb4bad8ae812a0b951865f77b4d1cde1b54663d1a6b0f71f87ff3b594934ea79"

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
