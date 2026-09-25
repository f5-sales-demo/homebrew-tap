cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.1"
  sha256 arm:   "2a9897387f9bfe9665602726f7ee07513e500d2f41779384491bd451e81436b9",
         intel: "371fd4ad60bb51ebabf9ec426f974393837e18ed8475a9502fe74d662c6b75cd"

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
