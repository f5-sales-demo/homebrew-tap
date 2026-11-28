cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "25.2.1"
  sha256 arm:   "e2653ab3c5174fccc50bcf06bac9cafefa5dd8113162cf983ec652fb16836e61",
         intel: "fae6242cf2c6c7c14a5506bc36460a63e8bbd62c295e4f5ff718dfa76c2a2c8e"

  url "https://github.com/f5-sales-demo/xcsh/releases/download/v#{version}/xcsh-darwin-#{arch}.zip"
  name "xcsh"
  desc "AI coding agent for the terminal"
  homepage "https://github.com/f5-sales-demo/xcsh"

  binary "bin/xcsh"

  postflight_steps do
    run "bin/xcsh", args: ["chrome", "recycle"], base: :staged_path,
                    sudo: false, must_succeed: false
    run "bin/xcsh", args: ["office", "recycle"], base: :staged_path,
                    sudo: false, must_succeed: false
  end
end
