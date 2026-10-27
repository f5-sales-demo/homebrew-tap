cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.1"
  sha256 arm:   "0742eb391551c09f14ea9768c3db1a964b70ace90c2f56a26815c3d5f9a1b106",
         intel: "f8e11b2b4681e2d7c8aca487925396bddaa4fccea800318db3a2435ad009c039"

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
