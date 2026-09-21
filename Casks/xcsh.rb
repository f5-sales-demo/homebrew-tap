cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.37.4"
  sha256 arm:   "8c71e33f4732b83c175f59906098bbcd684df5a32562329dff9f99968ef1822a",
         intel: "e69d62ccf4eb6f8c1e0371d7f43a96a8d0df608a50518caa8db93b2a2f965839"

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
