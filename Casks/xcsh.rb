cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.9.3"
  sha256 arm:   "c8a9f37df97b53df25cf024195d07f59e2e8bf51212241cd73e157297b3b578b",
         intel: "523d57f1906495876a17c181fb41e14cc423e145500bdab009d395707e763e2f"

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
