cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.9.1"
  sha256 arm:   "6323d194b12a4b0f1ed10b46a57ab4c6a7f36dad0941efd0e32f81eb20f0e2c4",
         intel: "34761e8412893d884a07767dcec8536f2a67b6e42bf4199702fdf1179fe85961"

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
