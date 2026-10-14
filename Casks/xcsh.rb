cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.3.4"
  sha256 arm:   "8f5f027422b09908cc32f59b499605125b569efda32879d4f5f19bd22f9add6f",
         intel: "b8f973bb396912f39d2c41ea5feb984eab867563d6d6b995d2b6691e89823f46"

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
