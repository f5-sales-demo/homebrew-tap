cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.49.4"
  sha256 arm:   "ce03fc0943a22f61b18551e6cbf5ee041cf496ea259b1a03ea6c547dca012177",
         intel: "701d05cd5a720ce01fcf5af2c02c2af0b1a9084610d8e6364940efeec5f51da2"

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
