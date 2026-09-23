cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.41.3"
  sha256 arm:   "88b006d4ebf3b8933361b86905aee8e6d4f7a9a5f87d48e1c554ad1859d117d3",
         intel: "2d800ae2d031394f1618bec2a21142fe27e71cb2d466ac7c0afb478c57203503"

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
