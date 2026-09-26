cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.7"
  sha256 arm:   "c9fa620114fad118ffec62e7b81edbe1f9350184a11243b5a0b5c2671aa6632a",
         intel: "01e4126a30fd9b76354ee5e08798941e82d0d18bdcf0bdd4c47a2d23df96517c"

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
