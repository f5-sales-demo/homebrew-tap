cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.0.1"
  sha256 arm:   "d8be20bed27b9d2802d45b610b7ec4092be121face318c816aef4d184ecfde70",
         intel: "a8f9c22a6b6983849c8ead48468dd0b5508aae49e925cd70c4095872a7ed0def"

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
