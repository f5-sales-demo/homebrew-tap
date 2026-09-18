cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.3"
  sha256 arm:   "c8c8757efcd78d0163b4f9af6e135baab6ea5c31e5ea332a420a74968e409844",
         intel: "a2510f0e0d9226364a0e2670e7bb1985a8bc0ef4b2dfc52626000fc5b497af20"

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
