cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.8.0"
  sha256 arm:   "f0914f3570cc7038dbd428ae0d6392a4e1f0c93beed40e5abfda3f0da6a15d5a",
         intel: "96fdd816b17540fc7fc1d851d93e0deb0cbf5986cc528d4ee6dac82b934d8154"

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
