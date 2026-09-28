cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.2.0"
  sha256 arm:   "61cd062e6570eced93a541bbeee4b9d01566a5689198a1fb272dd7c156d362fe",
         intel: "22e8c38f3b2ec020d0bf11d9d0086960764c605080880cc2ea4dc7ef9f2adffe"

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
