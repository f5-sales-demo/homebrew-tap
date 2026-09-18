cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.2"
  sha256 arm:   "48fa23fdc0306241b35c709eb24bed27773306ae539f27266fa86a8c8919957e",
         intel: "eeddc052920e52747a9e735ee3237a83a4412aef8eccec58e93f84e9f932624c"

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
