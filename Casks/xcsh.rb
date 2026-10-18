cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.6.0"
  sha256 arm:   "ba67abbebb920ee85d62d502222d4d2b61d580b37c97d8caec32b3673f69b05d",
         intel: "f932c2a49b8f2b414845dffd45f45be27f0559ff71023b6df8a1cc0e7a23bcf9"

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
