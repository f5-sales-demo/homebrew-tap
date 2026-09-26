cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.46.8"
  sha256 arm:   "bff5d151455836bc1037b556804eade111bb61cc3a5506c81ef6c9d489b10de3",
         intel: "661a9101e0385c3b66216a3c93afc4e2abb0347b3cc813ae177e4907d86d9735"

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
