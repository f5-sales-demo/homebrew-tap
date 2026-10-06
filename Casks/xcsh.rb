cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.10.0"
  sha256 arm:   "c7adbca548f575bf172015a07a738ab29c934b185dc85ab150d9cfbb843b9b45",
         intel: "969ec3c8ae762af9337f9814d9319a07c7117139d3d571d8fb7ff4a42be82649"

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
