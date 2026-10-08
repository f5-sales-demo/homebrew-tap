cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.1.0"
  sha256 arm:   "e7212a9155db7781c8d7aa74c875c269bed3e8ecad367edba61d7e2e287d84cb",
         intel: "f2e666cdb75f068001f18a20d317379c27d2ad64113394524c85411e209c42bc"

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
