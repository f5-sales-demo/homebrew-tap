cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.1.0"
  sha256 arm:   "3fe811650827dd485cd46f437c6837e87cdd7701766a2606ef7db3f4742c9d30",
         intel: "88d20722f206985814a4d849a1483a5c7e4eac672967962a7f6b3f65bc258271"

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
