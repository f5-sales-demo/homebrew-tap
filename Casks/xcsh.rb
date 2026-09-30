cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.6"
  sha256 arm:   "399fcd73597a88fc9c0806a2fc508a9f494272a12ecbebb0fce8b5a30ddd75c4",
         intel: "685a4eea2490c396244f8c35936d5bd26b15be1deb61c456a77a5ac48ba2868b"

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
