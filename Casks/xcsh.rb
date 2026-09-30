cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.5.2"
  sha256 arm:   "4ce8532ce586e24a67ead4ef1debc6f5a9dd469cc97377f14db30d9fe2bd1f6e",
         intel: "feaf012d90e771a006017b4eb5786342135ce9d0390ed569ad7f045c7516c3d4"

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
