cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.37.5"
  sha256 arm:   "65b094b77257295347c2177d3db20a645e9683c79b85d7a994bf9a573f673283",
         intel: "98d34f34ca649a9c7771268a648f7af254ec284abe0af2d358408b8dfdc19c53"

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
