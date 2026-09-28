cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.2.1"
  sha256 arm:   "355996e472a3160de797d7bc20fd908f1240eefeeaf06cd9da082184381aa9e0",
         intel: "2ef7173e69524688946165421a334d8ea64ebd9e04dd4a931ec53d5da85f4321"

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
