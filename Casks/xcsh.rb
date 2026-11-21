cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.16"
  sha256 arm:   "280c5d5866500b108a6324ff4967a677b05896420122606bdeb19723312cccd5",
         intel: "f6956a7c1b1b16dc6ab6fe04c9b717b4170510dab48166397da2e2e10bb22e0a"

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
