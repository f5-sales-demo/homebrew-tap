cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.13"
  sha256 arm:   "2290c647a8b246bb4d10ee6d80d39a333431149c096283562f4553b0d890e6b5",
         intel: "cea5d54abfaea223d32909d4dcc0ea43bab96b2731407d385daa5892e7928e2e"

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
