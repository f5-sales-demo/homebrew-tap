cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.13.2"
  sha256 arm:   "ebe11c57ec31f5d1a5b32007ab749589217afc0753b3198124ddac8dacc0eaed",
         intel: "6295305a14195cd610207d417472804d4d02ebe4f6e44c394bec351adb81f817"

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
