cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.14.0"
  sha256 arm:   "2164bc6f17cbad64f98ddbab25c1ee023a3b6da690fd6faac0d817ca45f44e4b",
         intel: "e7d895dc603d2dc87c063bed0319642c5985868fa77b343a977d3d9a4a6afb08"

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
