cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.5.0"
  sha256 arm:   "cf2c4540b6e794717670f4c11db52476f436e1fc088ba4de45fab70d7501a84b",
         intel: "86e110c0ee5aa5947c6c22d3d1a96700cdb4fa8f75abcc6d0f297be6d4b65435"

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
