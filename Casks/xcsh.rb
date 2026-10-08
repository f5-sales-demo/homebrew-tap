cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.0.3"
  sha256 arm:   "2ce963833721ff66325f82d5d5d9537d761dd118e96598a4f22af9ba86b57eb9",
         intel: "cfc348f2c8015a0869bb3d52e37225b3916af61afccb05cb71a3265005a5b98b"

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
