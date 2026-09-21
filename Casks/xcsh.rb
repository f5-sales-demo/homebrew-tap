cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.35.4"
  sha256 arm:   "c15d1fa1bf44d94ed53051b485b8b23061f120809fe74e66791516fdea453440",
         intel: "eaed78ecafdf1d48ef9111486c1b305f2c8dea6cde0eed610a42b8c8a03c5400"

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
