cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.14"
  sha256 arm:   "b431b0c772ad79d21843dc205a105a205c4810dc942c4cdfbe5aff0efff95313",
         intel: "91b257d1d7206bfb001dad04b035139844e740fff872756f9fb2dfbc45f32227"

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
