cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.5"
  sha256 arm:   "2ec2fc89736b21d138e0822a5721c7cb10849e226129ce46b734b6a23305a997",
         intel: "f7ad21a72945a4119b66926fceb71a7cdf2e2532783f5e8263c9904bf8a65d67"

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
