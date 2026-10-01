cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.7.0"
  sha256 arm:   "2cb3430f287c460176f1f4241dff75b26391bdd717de46190d1450945b8886bd",
         intel: "5abcc2b716afedbdb76d5e35d6956723c8509a0750b51c69cfc6ffa4572750df"

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
