cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.3"
  sha256 arm:   "3412cdf7878a650e29e6df80fb5832d7c2d0950de8b3458f16460239205ba8b2",
         intel: "8e013798f023551d612cdf8245d81ec24c8b1e99124d2113d859157b2828d9ad"

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
