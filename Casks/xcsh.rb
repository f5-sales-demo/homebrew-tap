cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.6"
  sha256 arm:   "760a61dc20ad7171b253e803e474a7d0515a2429054d5c2337dcb7f29cd71008",
         intel: "2b230a51631b849dbf5ba66f240cc654f37ba4f9598f99f410b14845fe9029d4"

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
