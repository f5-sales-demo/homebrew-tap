cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.11.0"
  sha256 arm:   "46bc3960e832361f8489cd1ec59c66c01da10990be77248538dcb5838992e8c1",
         intel: "47cfaac425758039802047b73f6711646a14366b4d4b6e6f6328b63aa5759ee3"

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
