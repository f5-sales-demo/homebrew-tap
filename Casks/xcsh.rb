cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.37.7"
  sha256 arm:   "500c83f25f3de0c5dca31ef353dbe6766a834f6addb7208bfc77ce75c10b64a2",
         intel: "fad9d87a05bcaf99627b2bc8e08d57b82d1e39169475749c6415101628f2314a"

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
