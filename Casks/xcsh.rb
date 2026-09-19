cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.7"
  sha256 arm:   "240fc78ac4a36338f46950886293dab800ecd1c18592854a84d0f06827f089fb",
         intel: "6d8fc7066b479b974252a81c96f95c015b86f32f60cf68acec4e0589a312023a"

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
