cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.11"
  sha256 arm:   "8d831edc66c98218e9273c2fa6c07226ab613478eb14bd87de9c2741879dc684",
         intel: "a741171d119c9a0bba98e371324461966756aca823fb64afd4a0ee01bd827e65"

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
