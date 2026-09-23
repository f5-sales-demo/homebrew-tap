cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.41.0"
  sha256 arm:   "7189250a6742c0756d60ba8907644e3a360edc4815e8d49bae619c75c6ff83fb",
         intel: "6e38f67460a8cf0c70b6236ca4333322074e8daf158298b859ebb232655ea442"

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
