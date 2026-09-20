cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.35.0"
  sha256 arm:   "047cb802f66b2501502b4ca1cb8dd7e3d46952690b3b060ab49336e117c256e5",
         intel: "b556e30e4b0355303f557e0ca0c19da0b1fff4a6ef2a84ce194a7501a954a7be"

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
