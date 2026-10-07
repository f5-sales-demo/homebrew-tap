cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.15.0"
  sha256 arm:   "02a72f91e3fe3ee4ade1ad5cc934502523781f5a38d4b92f8a84339bece37429",
         intel: "2441308d29fec1faa00e4956fe823bed2b57dd450ff96275c66af61548594df8"

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
