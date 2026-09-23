cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.41.4"
  sha256 arm:   "80f6ce6ffa50f28880506689aa533057316837d017f195b12a9a7ed52ea36db0",
         intel: "7880f374ebb8940d0ede3cd5d1a9b443b5211df943c18a5d4b7cf1cf976282a9"

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
