cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.9"
  sha256 arm:   "421eacdf090d7339ca2229044cd72095df43b7148cb6320020ad35ad8faf8982",
         intel: "0cc455e72ce2fbef55698dcc3aa266b4c1686392243efc103accc17e28ffc6d5"

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
