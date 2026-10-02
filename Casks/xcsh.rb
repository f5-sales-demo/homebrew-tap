cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.8.1"
  sha256 arm:   "9e268f8a14b5e191721cf0e9257864b51d8d6bb12a99492f02af852e016f379f",
         intel: "70da6627fd881fa46559e705d02945882488de4c215f3d9a3ed0e8f905e791b6"

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
