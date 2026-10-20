cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.9.4"
  sha256 arm:   "5487de8e32d1790ce624891448a8f31c53e682f6c101a64c9125d78baca2279a",
         intel: "f9370eddc7c34bc3a8a485f5bae987c7c48bcf07981b9b14a5158ef865a30f52"

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
