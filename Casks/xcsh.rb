cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.5.1"
  sha256 arm:   "327bed3555303de11173d54666769137d1d9d79da7fd627f863a8219057b7515",
         intel: "ffa3e20f2a9622591a26fdf241d7f616a859b5dd115959fc567285b92ab32b5e"

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
