cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.6.9"
  sha256 arm:   "091ed2d9be0910792ed22fa120a41948c22b9d14fe3d9f005b64fe8af09e89e4",
         intel: "1cf381c75a43b6d162b414e9fbc2fc466b8a5891e0740a2565c1ff8701339554"

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
