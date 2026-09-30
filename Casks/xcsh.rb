cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.11"
  sha256 arm:   "9138e0c8c199916a71c2ae4ab3f2e96f64234fae92175c29e50ae08adc4c4383",
         intel: "bcd6c425ae7a3573597380aeac80da33beb77f09c45cc87a252c261dc0c39c26"

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
