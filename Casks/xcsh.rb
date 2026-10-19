cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.9.1"
  sha256 arm:   "2492952ab3328f4a26e87f6333d7938ed784420384c94ca54f5890a35dd8c106",
         intel: "8e72f3f43300c7b360d824ee313a0330f587ddfdb99dd457f31e6c10a7ee1b2d"

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
