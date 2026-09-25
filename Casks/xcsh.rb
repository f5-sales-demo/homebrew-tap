cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.44.0"
  sha256 arm:   "8449029713e13431ad93dee1615203412f4981c2b44f029359b63120505a9492",
         intel: "939343f820d95acb4280e0256fb7ae403148976632ba2ea277d77ddab5ab63b0"

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
