cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.5"
  sha256 arm:   "41750b2cc6ba143d1054b12992937b9618dd4a0a2588db30385e12c68d71441d",
         intel: "7b7fea51b1501e0a461edc05931be3d1e33be934c30c600eb5911fd48a027978"

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
