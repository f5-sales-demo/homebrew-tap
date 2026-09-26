cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.47.1"
  sha256 arm:   "0fafd191d451b8e1fb0554bd6be09cba16593bb71931cb35be100ff36fecbfd6",
         intel: "ce9707b4628759ad2e54c2fa414ac70cc428da50323dc21938dddef63dbb22bf"

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
