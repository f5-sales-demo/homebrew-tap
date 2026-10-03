cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.9.0"
  sha256 arm:   "eb9fa8407331d2062cccfb9d0d128f4cb013a9b18a57403d815942d56637ee1d",
         intel: "099fe68630e3afb91a1b6cfa47a653b3c8a13eecc07c6f32c2530bd9238e5cf1"

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
