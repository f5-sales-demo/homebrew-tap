cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.1.2"
  sha256 arm:   "92711651ea9532e70917fe7842d98857d4fc6be87061f87a325557a641e83096",
         intel: "eeb9a7f892693b8f9693324a3b04934ad1402e7df851c7d54bcb7d2f7cf52faf"

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
