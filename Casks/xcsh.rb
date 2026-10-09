cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.2.2"
  sha256 arm:   "a9d0d12857732fa74b41d12bfd57673d8d2c1cfe068c510e4c2fe7ead606bacc",
         intel: "1d099fbf7d9b549a25fa0fcc302532b90b2493d50f533b5d2b5a80a609667aaf"

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
