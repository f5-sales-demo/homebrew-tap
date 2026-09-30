cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.3"
  sha256 arm:   "a0d5bb0a999d8afe81252a4c0ff8741db27cbf90a836f7de7bdde84f174bd754",
         intel: "1c90d937a9dcae18cbf408f436cbf501cbff2d5f86122b0ba0015ae985d46aca"

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
