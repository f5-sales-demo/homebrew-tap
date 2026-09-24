cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.43.0"
  sha256 arm:   "a80f01bbf231bd02673f6888bcec62aefa5277ce80a0cf6bed45398928ec70e9",
         intel: "52894845e9179670dfda55232be46ed4fdd8d28b77495882054ae58bf922fb20"

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
