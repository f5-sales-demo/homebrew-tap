cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.13.1"
  sha256 arm:   "5f0dc1f1fb33aca46930bafdbc77edac611bd17bdd9a1733bc51177e15fa4311",
         intel: "1c1fa070f68029f899d94daa65801a222d797cc0d6bd26e831dcc69e235c05d6"

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
