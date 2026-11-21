cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.17"
  sha256 arm:   "c2a842dec11b135a76039662018184042a5a24e046d27249436ff16b72a93cd3",
         intel: "a61acff70abc0e9fca82700e2d21a6d7a4d9bb2b47a65ca03117b125bd2e4d65"

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
