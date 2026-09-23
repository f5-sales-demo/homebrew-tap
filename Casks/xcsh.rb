cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.39.1"
  sha256 arm:   "68e9640f2b1ac050b5e990b2cfe122ea4a6624132b6f4591b31a10a31f36f925",
         intel: "1b86366e797168ff316aed8cd5aa8a307f164e1758b49ddcb950ef4efd4d28cc"

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
