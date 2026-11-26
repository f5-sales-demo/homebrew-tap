cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "25.1.0"
  sha256 arm:   "c5f35e8880d353b024d6c98f9ea41fda14e1733f52c1fa1230e6f1c315e6eaa9",
         intel: "d2df1d7726c71d26f579a669b87a2609697b09b4902a22e00270824bfe568cd2"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v#{version}/xcsh-darwin-#{arch}.zip"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  binary "bin/xcsh"

  postflight_steps do
    run "bin/xcsh", args: ["chrome", "recycle"], base: :staged_path,
                    sudo: false, must_succeed: false
    run "bin/xcsh", args: ["office", "recycle"], base: :staged_path,
                    sudo: false, must_succeed: false
  end
end
