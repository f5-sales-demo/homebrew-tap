cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.12.0"
  sha256 arm:   "bc9876859025b3838f2427bfb73782f29cd2f64e5f9769edb689b1998aa0bbbc",
         intel: "fd4595b76ea352abc126b9dd613cf62d86771e7ff4337de21351e10e188ab341"

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
