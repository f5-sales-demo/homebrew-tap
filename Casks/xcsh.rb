cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.47.0"
  sha256 arm:   "227b390cb34cf10e6823d056f55bf00682d8e15c2e811bc8d9e4279b8245438d",
         intel: "bf5c4ab0431f53c583758ab7bb0c8b880bcf2d583b3d713ccccb21e74d9ad744"

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
