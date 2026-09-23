cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.41.1"
  sha256 arm:   "03563f35142cff170eaec9e1289718cb3ba1936457d9a36a72e15ae22f8a4ddf",
         intel: "0eae70f1bba3d58c780bf03e047ab696eda32927aa428dcc04e9065bb1f1285e"

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
