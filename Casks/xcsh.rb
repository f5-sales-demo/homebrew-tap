cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.12"
  sha256 arm:   "568c5781a3e4957d86caed4c51f4fde2db8c760f5a0a4e4616bd159f4a06e48f",
         intel: "c610916e24aab3cd7bb94808a74334d3ed3d8b4e82bd61c1611561e2213f7e11"

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
