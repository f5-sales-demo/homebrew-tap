cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.0.0"
  sha256 arm:   "fb4331f00204505ee316ec4d20f4a8e1c1784573d5ec4e01c78c24ab15ee8551",
         intel: "f3fe2ba59fa689eb752d5e05a959ec968da7cb4cb9284055148c1a5e85c6024f"

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
