cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.3.3"
  sha256 arm:   "211734bbdcf8bfa8b7746089b72e562d92bc0497b68025ab3e82d011858d87b0",
         intel: "a64dce7161df2c8b92929a7be2b8a61ab5629920b7a8627732d00d906a8ec359"

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
