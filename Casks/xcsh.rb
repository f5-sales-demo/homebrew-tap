cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.45.0"
  sha256 arm:   "9e9f057a12d9ddee4d2b048649b51c55eac945effa1ccaade3a03695c55627ed",
         intel: "8400f38c4849fc503ff5d16ca99141e7c6e42854e8ab0d19198036bfc44fa363"

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
