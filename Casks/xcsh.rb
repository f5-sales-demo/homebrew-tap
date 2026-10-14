cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.4.2"
  sha256 arm:   "ea3e6d68adbee3fc677a272d3ed2b845c1deb83fb443d6b5319ca24dfa9c1bb7",
         intel: "a4bbda9b337bac8b14380783cb4a48148f12b394921327bbffc2ff2892df8812"

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
