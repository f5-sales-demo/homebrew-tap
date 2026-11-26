cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "25.0.0"
  sha256 arm:   "c05d1700148c54b7e783c068413f9aa37dd645694dfc711dfb2af2fee3f94bf5",
         intel: "6a246720b028a9729500805e0649892134f0176d13fe2ca32dab0092a22f4efa"

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
