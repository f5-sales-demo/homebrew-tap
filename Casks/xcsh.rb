cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.1"
  sha256 arm:   "54454782be3356bd39619518f22d9371ffcf0d7db0f375115c9f97f7d443568d",
         intel: "1f526efa047c98c0773e79fd4acd56c994efca5d990e79a5cc07d32909857a5f"

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
