cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.5.0"
  sha256 arm:   "fda549c7be7fc0f11c171c054392e25394b71663f9a647d636d6c83bea00ee2a",
         intel: "5f0b06f2102d5776be1ffa1ed04abced121aaaacf1e71b054fc4134ab9270ef0"

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
