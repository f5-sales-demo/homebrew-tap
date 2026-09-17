cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.32.0"
  sha256 arm:   "0777e2bf029ad8cf732c8c0b95abd9e506a974c6856eb058275b2aaa439d3497",
         intel: "e662478f3c7053905ab60ff92d09048327986555879bd2f2f263c6ff68fca7b0"

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
