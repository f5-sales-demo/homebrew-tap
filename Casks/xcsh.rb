cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.7.2"
  sha256 arm:   "acae56511f8686dc08faef9365d193d6fcbb7ee1b9691472322de93aaacbfadc",
         intel: "e2c2054dfc9c74cce1f650265617ba695d5af674597e429c41b2efa3f0600fc2"

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
