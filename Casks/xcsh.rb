cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.5"
  sha256 arm:   "63eeaa8d36fc4b774b0f98910a8b02245299379b5ce875b22b00f330fcd1bb58",
         intel: "21d927342ebab7a5fe0e687c9ceb0133dc1f4d92f732af5874f27ae8fb2383fa"

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
