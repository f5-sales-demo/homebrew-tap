cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "24.0.0"
  sha256 arm:   "12c96f93daeff7ed2a3a3559ef3b24a48e525aa75347ef7ad3f39534d59619ea",
         intel: "b6661fdfba423ea3dd34fa04f6a9af03d604ee59b2bd8b25e2f46f29661882e5"

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
