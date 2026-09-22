cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.37.6"
  sha256 arm:   "c73533f2bb639fdacb86623d3f87461dae44b888744d38ff89168b62c7aac7d0",
         intel: "7f9ebf33b9c4ab26b6b842aa6b271f00028b421b254fbc9e99a0dd2f8a1b7308"

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
