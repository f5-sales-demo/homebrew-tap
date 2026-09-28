cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.3.1"
  sha256 arm:   "0bcb735cc2253516ca2df2559c5dd3c79389e142c0464f195055c86196c179f0",
         intel: "5085e8092cae7427641971f75aed215f9af8ac326238bf89281d5290fdecab67"

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
