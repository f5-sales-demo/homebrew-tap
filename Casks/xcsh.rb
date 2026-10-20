cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.9.5"
  sha256 arm:   "3e656d45ed47a1565169497a7842ec965400f477f37c9abff5914d46eec6ca83",
         intel: "90c3fe2fc39c9d52f9c359c5e4f0e444535ffa4bbf92807224382919bbf99d97"

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
