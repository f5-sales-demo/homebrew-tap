cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.11"
  sha256 arm:   "91907d9ff907738466e38312b72cbaed5e8d78794be16b717ae2bf3440eebdba",
         intel: "00cd3433b762aa2ecfba252f94127648006fb3332fa5487077dbe4ac1adee7b5"

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
