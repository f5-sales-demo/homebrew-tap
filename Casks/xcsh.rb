cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.36.1"
  sha256 arm:   "00f36216d0818ef79fae5898bb845dceb29d4ba0eb62c382be19d87fa5b53a6d",
         intel: "820a1e5fe92d245b8248cb1ea269cd322b6308cb763443de40361835195d84d8"

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
