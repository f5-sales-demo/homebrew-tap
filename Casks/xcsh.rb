cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.43.2"
  sha256 arm:   "ec7f48f0ad5c4c97090cd2eb47f6b88aeac41481e85c53a94018d955a1dce3fe",
         intel: "94370deee66d8fc22776409b6192eeeec1b2c2b39900cf214cd5fcc60c01137b"

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
