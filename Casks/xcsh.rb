cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "25.2.0"
  sha256 arm:   "06a9e7a52251e6506e1dd1ad0487e2ba01c556ee0f09188eef01ad05851ff7e1",
         intel: "d4c7f27535a0af297dde6c4ef26c814fbcb745a4928fccac15e2a93facfd104b"

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
