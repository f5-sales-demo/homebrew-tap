cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.47.3"
  sha256 arm:   "ac880153f8c79380b785f92498744ec5c854c88ea16c19ba1f8f249d7cd7947a",
         intel: "7157b72f1540215733be24c91a1ee32f58ea7f66c01eba2e23b67825eb59a1e6"

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
