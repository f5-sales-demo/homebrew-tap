cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.2"
  sha256 arm:   "6ae0c3d2b45cf9a6bd15e18978bed9e71010fb03b02fe0a22d85478e0a8db24b",
         intel: "b976157c02b32594d75242a4e4fc597179ecb23cc545d2202e8517d1a6863468"

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
