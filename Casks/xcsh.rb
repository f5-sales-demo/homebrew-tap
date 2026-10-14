cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.4.0"
  sha256 arm:   "5ee1b65f4cd932e267e96bbbfba2e4400eb2202d1c4fbaa9dfdfee6dacc3a181",
         intel: "0171fe4fcf4be36ae9069e2921550ffafefc77fde982dc8ebd21b803a3c04239"

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
