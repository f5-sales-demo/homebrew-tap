cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.14.5"
  sha256 arm:   "16bf30f19421768ad0a5d26f14dabd95d98fda17b6797f74212b015398601e0d",
         intel: "997e3e3f55a6dfb24bb7cd35c619ec89669faa454c5414f22e49839d01733876"

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
