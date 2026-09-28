cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.3.3"
  sha256 arm:   "c6703b0999f570ce77e40c8be9f009ec2f0ddca87936290a4fc5679a0181f015",
         intel: "2c7ae932042607946a4e6c954e172a3ce23cb1d9a4318d32836694c5d8e23e15"

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
