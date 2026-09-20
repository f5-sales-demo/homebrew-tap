cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.34.0"
  sha256 arm:   "243a9af6d32af87fa5347fff41e0915590b736ffff74cd36af236fdaf3079e97",
         intel: "becf3c05559e501df5dbaede44a7e41b4c06caf42a32941e7c140d4989a9305c"

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
