cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.13"
  sha256 arm:   "b84c49ffbc2bf157c14b2b5e0cd1006f8487240d6f44b2e10d14f602bded39b0",
         intel: "ef9310d04889f0b7d9cf78a4a18c104972f8618d11bbb6082062afa4fccc562f"

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
