cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.5"
  sha256 arm:   "924a27b4f18ba34f8211d8a5a27248853e51dd89df951f1bdcd73587fae9fcc3",
         intel: "752185bdcf17970694a69a0fffc3d0c37f6fd27f0bad014fc0404a54518df2c3"

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
