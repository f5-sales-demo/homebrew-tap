cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.41.5"
  sha256 arm:   "645aadd7b242a3bfc19918587cff6ed85ca9dc09c009f52a55e66766def6f9de",
         intel: "ccb1e9b875a2122c1cb6e5bed18759e35405e46b74b93998f5af113e3044935f"

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
