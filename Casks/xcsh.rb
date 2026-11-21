cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "23.10.19"
  sha256 arm:   "3a065ecd828fb3c54cff3989ada3d9b3b0bf7a8894936a776d9326515276e0ad",
         intel: "1ef32ab394dccd73b82caaefaaefc2285efb154bdd6b3f6416874cec6fdf22be"

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
