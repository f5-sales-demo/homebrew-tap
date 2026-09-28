cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.3.5"
  sha256 arm:   "cf2d8df248a2d79a261ef558c8729d443f9167da36e29aef23965f663784e305",
         intel: "d62df0b197c0522b68ef3910f3da60348629496ed1e85cecee9f9d0ceab42e05"

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
