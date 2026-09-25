cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.4"
  sha256 arm:   "04a430db68d4246524799cb8ead339052475b88a4a849d205ff42f5ce5e873f1",
         intel: "dbf7c34bee91b520d09471cf7b545189fbfe958eb6dbcbac7ac1bd38ec5cef73"

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
