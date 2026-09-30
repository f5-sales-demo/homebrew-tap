cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "22.4.8"
  sha256 arm:   "d422b33bdddac133cb2eccf6a3f19d77376444ea58982af135f3cd64978c8afb",
         intel: "27df783231c5f0d889c568c39f720a0b3ec1213ce24e290bcff8d1c122f54996"

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
