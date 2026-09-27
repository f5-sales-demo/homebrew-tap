cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.49.2"
  sha256 arm:   "e10bbbfaa6e9806810e1b75dd8fc6e110172ddbab9609eabc99425d7eb99ecb7",
         intel: "18eeb2c6a0916d739a599b1ccff57fcc01f504aeae3c54dec7c32ac0737601a3"

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
