cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.43.8"
  sha256 arm:   "c073d19787d7e51fa8df0535fa581eea62a058091effd5de76b9d8b7b3ff6e68",
         intel: "1386a2b2b14555b34159efb732535dbf730a0b942bfc7da658a5287f43f758aa"

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
