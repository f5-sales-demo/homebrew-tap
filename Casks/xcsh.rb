cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.9"
  sha256 arm:   "7e73de9c78f115eb4bfe03e5b195d1e9c8d0c9d2d14f7ffdde9376a2548e274f",
         intel: "638231985d6c5b7136a817b1145a67bd2c4507d1efc2bef538d0522dc0f3fd2f"

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
