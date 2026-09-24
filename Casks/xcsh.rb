cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.43.3"
  sha256 arm:   "0f98c926ca180e07aac62c6c95f9f1bb22b65bad2e8998d0d28821ea1da098aa",
         intel: "adc862670d874baa70b9f1c468de1adb252f0aa1c0d950d129e539b0805ef087"

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
