cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.45.1"
  sha256 arm:   "7ec985edab83ac751e9ea1e648d9de081b5b2dda73a8dcd2b3e1d5cb4aa61c1e",
         intel: "714d69e0b79bf4349e313b6dc9f3828376fd92f76cc2d0edc0f8fc7aac3202a1"

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
