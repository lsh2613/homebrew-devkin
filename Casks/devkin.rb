cask "devkin" do
  version "0.1.0"

  on_arm do
    sha256 "REPLACE_WITH_ARM64_DMG_SHA256"
    url "https://github.com/lsh2613/devkin-release/releases/download/v#{version}/DevKin-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "REPLACE_WITH_X64_DMG_SHA256"
    url "https://github.com/lsh2613/devkin-release/releases/download/v#{version}/DevKin-#{version}-x64.dmg"
  end

  name "DevKin"
  desc "macOS toolbox for developers (JSON, Byte, Base64, JWT, SQL, Markdown, HTML, Text)"
  homepage "https://github.com/lsh2613/devkin-release"

  auto_updates false

  app "DevKin.app"

  zap trash: [
    "~/Library/Application Support/DevKin",
    "~/Library/Preferences/com.devkin.app.plist",
    "~/Library/Saved Application State/com.devkin.app.savedState",
  ]
end
