cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.43.6"
  sha256 arm:   "7131b42e1bba01d16d299f6940f6b9f4dce311fae38beaff640b66a20cee3e5b",
         intel: "bb5e3e4a296c14499461c3ed26816cf7de2ab7ef0bf6174d090b66ad17f3815d"

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
