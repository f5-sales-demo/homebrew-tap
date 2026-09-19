cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.33.6"
  sha256 arm:   "11d374d8c819ae7a1a972ec6e5741550c34392e34dc4cfea34e001e83aaa6525",
         intel: "8d64902c01f7a68c26ec5b098e8a73368f024f0971e906ba8a01e38c23937692"

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
