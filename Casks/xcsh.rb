cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.8"
  sha256 arm:   "5bb08f394a5940eb5cf6908abbf8b51f791a88865e7bf2fa27fe329f657ba7a2",
         intel: "3e7a1e9c0ce74623dca9667879191a382308b8504f54b3091294dc5f479fc0a0"

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
