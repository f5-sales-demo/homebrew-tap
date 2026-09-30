cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.5.1"
  sha256 arm:   "8cabbbc9e5974adff8784280d1ea40b89d3bdaa3b9228129c950c10b9efa2ac3",
         intel: "f98822391b71e333c2a99829d5651ee6db5491c127a52a509468e67bdf55b6e0"

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
