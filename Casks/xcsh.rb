cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.32.2"
  sha256 arm:   "7256835c2d3df6ff26d38d8cb9530b099973132b3a904198bdfb0ae300468b7f",
         intel: "11dc934ec3ea28170194a9003ba6ed60fe4f9ff27e43a7007fb681797c1fabde"

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
