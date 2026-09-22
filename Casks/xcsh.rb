cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.38.1"
  sha256 arm:   "78eddeb516cc69f21c06fb44c37ac5c772b4e31238870f5b3733c12d9ac2d26b",
         intel: "e0f151224db9705df80d030984c67bf0959f2e0c5bfebdd6d9b4f6016ec73521"

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
