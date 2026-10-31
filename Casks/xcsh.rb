cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.7"
  sha256 arm:   "59d81d0f78cbc71408cdd345fe08dc28113549d726ed6c8642efb7fb0e654de7",
         intel: "855b5dab035ee49eb48b77f94251b7af8864da09a1c42973cfb2159754759e8f"

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
