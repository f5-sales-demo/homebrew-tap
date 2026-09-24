cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.43.5"
  sha256 arm:   "a07c64cb99b02e860dde828928d98daa5b2c5a897a873ef8821f13e6f1bbe372",
         intel: "eac804f951f4838f080d764e719af6f3580e187c07d26663d0d805b6a8bd30e5"

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
