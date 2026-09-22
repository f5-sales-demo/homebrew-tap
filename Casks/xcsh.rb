cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.38.2"
  sha256 arm:   "5f22c19d2baaaaebfbb14131948d774bc23accc2476b9d0eee240472c245f9d3",
         intel: "13e8e3d3d6faa4a07efcce56446ca5ef1b2f8008ea9db4992565a7b40da838c5"

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
