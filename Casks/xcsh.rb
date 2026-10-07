cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.13.0"
  sha256 arm:   "be4ec158cff37f08e1581a4cbe4cfa501abea2e9c54ef336650f7844a2f6a2b1",
         intel: "46fba2dff664d04c316577e397f5f7c68f5499ed24452b9809592bd8664295d9"

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
