cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.10"
  sha256 arm:   "9ef9a14b3acb44a6cc06893264c7a090418bd930f29a23a6e35900d514f18bc3",
         intel: "65b0d59980f9b3a3f7537de921bd10ec1e766e5d3602e24cb410566d0b28b152"

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
