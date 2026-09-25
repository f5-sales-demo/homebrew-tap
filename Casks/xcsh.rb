cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.43.7"
  sha256 arm:   "a6e83816ca32992ffdc1e04cce3ab07cf477699190f1520c5cf795625f6f7e53",
         intel: "42da86f5620a39a65dc51ce6fba14e2c4aa2181f3a3f7995d1fd96d02cd05f16"

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
