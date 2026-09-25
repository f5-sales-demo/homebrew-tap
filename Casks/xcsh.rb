cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.3"
  sha256 arm:   "e17f5098c7652e15ac997cacd3d505f440ff684bd7097d735445155de5773faa",
         intel: "ec3c1bd342a4cd759fc5bca4d4403d0b6dcd52bbae36c272c92051367a3e8a38"

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
