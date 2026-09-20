cask "xcsh" do
  arch arm: "arm64", intel: "x64"

  version "21.35.1"
  sha256 arm:   "d152e8518925918059774f53d806e615eeac989d16ef3066a53b5432b5795f8f",
         intel: "238199244a47799e11d75e7e13f0096e5503f8754d711821a20d968052e60768"

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
