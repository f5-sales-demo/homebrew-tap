cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.44.1"
  sha256 arm:   "7aa2c50b96b76727ff3c75abf768c03e96c35851ac588ca03d08cd0d2eb63b6b",
         intel: "f9194fffbab28ce1b88dffe63cecfde16f5e1739304266984b5528d710d92082"

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
