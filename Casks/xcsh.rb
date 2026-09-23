cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.39.0"
  sha256 arm:   "6a4798f16e20269d9b0da4a3934f93e6779817683637cebbbbeb5107c0b6196a",
         intel: "684ab1891953ad370842da36d045fbf84dfbb177bf6be0b47e7773c77209dc18"

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
