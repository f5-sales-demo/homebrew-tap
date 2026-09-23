cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.40.0"
  sha256 arm:   "0b8ce5d6a51b8901d04e8e14fe7e0c7878097c5a15ca0ebb05f48adbe16626ed",
         intel: "d0c4f5632fde2f76fc98cb244d8ce5fc2f44970e8ddca8a85ff947aab92d2cbb"

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
