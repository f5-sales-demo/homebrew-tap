cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.14.2"
  sha256 arm:   "5a5f1eecc6a7c2089d39f136929a796e80d7d0de8df2e36a7518061efdb2c340",
         intel: "f28e7e01d1c862facaa22d4211af292bb48536f691abd271c20ac484340d8513"

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
