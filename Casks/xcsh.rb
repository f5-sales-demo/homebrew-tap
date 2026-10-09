cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.2.1"
  sha256 arm:   "2a83fe1f26bf05b7f229fb2edb2b49c1e0a20a17cfdf80baa280528abc300960",
         intel: "efd93a5e35d21b696b4c21a47a22b77db20e7ed791fa5baaff60c656830c3a11"

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
