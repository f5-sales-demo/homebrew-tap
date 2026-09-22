cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.37.8"
  sha256 arm:   "7d0ecd9a039648494b1f7f5e8e9688a58062830706920515be9ae8d71141de28",
         intel: "c8015c4f454f8c03243695febff3ef078be3801316259e6e191bb5059dd60c06"

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
