cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.12"
  sha256 arm:   "f925b8f6fad60ae99fc8cda7428d3d79cac26bf1331036508c70e5f04d00db74",
         intel: "ee24bd9c8ebf7d00af744483b823aa0bb6f45348e76f2cc2160c003fc883d8e6"

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
