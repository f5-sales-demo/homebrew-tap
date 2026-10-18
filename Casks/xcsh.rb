cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.8.0"
  sha256 arm:   "e7aa58176a9e9de71324d69ea916bc9082245c3cd03cdd418b40926b858deb80",
         intel: "93918648ce178126a30fe5b4d9d428243e39c54774ca21e2ead123faf7aae1e3"

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
