cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.10"
  sha256 arm:   "5b58ce31f5ec62576f403261d2d839b84763eaf4f3a6c55711832ce32296b2bc",
         intel: "934ef5823a8e345cde502e57627ed7e0d1707fba9f13b37f716252a9b1c327fb"

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
