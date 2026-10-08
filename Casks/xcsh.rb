cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.0.1"
  sha256 arm:   "89bc3488f9ca749ace121c8e1348bfe1f440cd897e7a595f07c3cddb5c5dd422",
         intel: "a8518b55ed537daee6ec4628aeaa6ea7c89b6a81c84f53d5e69a01340954fc4d"

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
