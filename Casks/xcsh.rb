cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.43.4"
  sha256 arm:   "6b204c3a0c01e85deb5af93c097bccdae160543bfd13facb5103878a5ff9f936",
         intel: "d77bb08000148541fe668ab530918e4fc721ca5c24045809d793272359c76014"

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
