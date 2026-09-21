cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.36.0"
  sha256 arm:   "e28bc9896af30bf464366b5da5354b8572b01363f9facac743d23fc6975dddc0",
         intel: "b2fc050749c753c92401b10674f12a35ad8bb87e1aaee0ee6a07f81a89928a48"

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
