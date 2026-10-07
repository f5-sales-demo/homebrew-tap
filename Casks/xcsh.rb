cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.14.4"
  sha256 arm:   "9e5ec7dd8c30001b6d21df67fdbdd4cab870fd9308f2b1dc52a123a015837993",
         intel: "2d9336e86f229011a41d605c8d57436e2c9162c133be7d8a5a4376ae0fca7943"

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
