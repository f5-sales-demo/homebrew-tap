cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.5.2"
  sha256 arm:   "9a82419c519dc6cf8bd9872086b3d445234924636fff7c34d7cc61908c43a0e9",
         intel: "198e7103103cd76dad103170057f74099498bf7f8029359c9ea509f06553944f"

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
