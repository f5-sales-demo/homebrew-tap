cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.9.2"
  sha256 arm:   "c5593ab79ef65374e9d76e61d05c69c7094654c9db0b998ca7b64b5161f9480d",
         intel: "1fcf81d7fd44b0911055408cafb728598c4685082e93ae6e54e7015fccbbcc7c"

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
