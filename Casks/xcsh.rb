cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.35.2"
  sha256 arm:   "9cc60ab5a95ce07978daeb14250f45ab4953dddfa8b3097b9fa696dae76da404",
         intel: "6ef1245c16bbd34c3a582b0776515fc205dd9f56eb9b60198c2b678ba4432d45"

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
