cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.42.0"
  sha256 arm:   "68ba788593e3f25120ad50856b25247b29597a09a03d79f74ecca890ab646491",
         intel: "e966faf6a1f6e6ba91a19efbcb644b44d76e5262717a81b880da5513c85dd99a"

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
