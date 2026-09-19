cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.9"
  sha256 arm:   "58892e4b23eb165641cce0db2aeae0ce10c582c8af4ab5489ca68b1bc223b997",
         intel: "5b5b321787b3e5b6319c4ee81199e577bd9d5440c529e82c2805e6e80189573a"

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
