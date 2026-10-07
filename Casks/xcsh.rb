cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.14.6"
  sha256 arm:   "231200ac4442e74960d31e0acd10f7c8cd92461e3d789cabad853f0ab3d7ee73",
         intel: "4d170572f8e2d16039c99a8ccd12956917dacf121dd8896a4ce864ab7edc44a6"

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
