cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.49.3"
  sha256 arm:   "e578711d8d7e34ccad8196e835f3fd37d93e94754d09804c164641e7fc99d318",
         intel: "fd3b97aa5b71bd0d7f2e86810b71da13305cd80d1991e9aef405831e142334a2"

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
