cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.15"
  sha256 arm:   "acfce9d1d6cf58b4b72ee8de857130d5b2ecfcc38f991fdbd9b4a7c2089beb20",
         intel: "0b920c34a00e50a65cc29e9636763a8c8f5ff46628ab6a4bc241c6e4bf6d13b0"

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
