cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.6.8"
  sha256 arm:   "c2e34dca1a829059a9a965858b5b46288916dc12f607b00c3a60094c8fa987ea",
         intel: "3b841fd9a2bd361a9b5547ec714738b47a5241135fb7c510a30590b3e7701446"

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
