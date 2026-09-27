cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.0.0"
  sha256 arm:   "bf43a7b3ff9c962853d28f830ede40c0774a3c1bfd0c2161b3efd72637c0c7eb",
         intel: "abb54ececc9aa28075f97c5b789c6ef3675fda3bad668ca57f55fa427966bab2"

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
