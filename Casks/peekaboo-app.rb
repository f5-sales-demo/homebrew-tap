cask "peekaboo-app" do
  version "4.3.2"
  sha256 "5a9cca84a387f7dc2d6f4bc4aba7a5c08368a941cba63f06f7ad1f809c944628"

  url "https://github.com/openclaw/Peekaboo/releases/download/v#{version}/Peekaboo-#{version}.app.zip"
  name "Peekaboo"
  desc "Secure macOS UI automation app and permission bridge"
  homepage "https://github.com/openclaw/Peekaboo"

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "Peekaboo.app"

  uninstall quit: "boo.peekaboo.mac"

  caveats <<~EOS
    Grant Peekaboo Screen Recording and Accessibility in System Settings.
    Foreground synthetic input also needs Event Synthesizing permission.
  EOS
end
