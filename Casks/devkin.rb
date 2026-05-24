cask "devkin" do
  version "1.2.0"

  on_arm do
    sha256 "ab2c4b7978eb8741d2117a6225536eb4393ce258ae666f2c1309202bb6ec0dfd"
    url "https://github.com/lsh2613/homebrew-devkin/releases/download/v#{version}/DevKin-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "af7a8d54139f13c7a0f8c616f6993c7fde612f25bd022dd8addd69c10fb223bf"
    url "https://github.com/lsh2613/homebrew-devkin/releases/download/v#{version}/DevKin-#{version}-x64.dmg"
  end

  name "DevKin"
  desc "macOS toolbox for developers (JSON, Byte, Base64, JWT, SQL, Markdown, HTML, Text)"
  homepage "https://github.com/lsh2613/homebrew-devkin"

  auto_updates false

  app "DevKin.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/DevKin.app"]
  end

  zap trash: [
    "~/Library/Application Support/DevKin",
    "~/Library/Preferences/com.devkin.app.plist",
    "~/Library/Saved Application State/com.devkin.app.savedState",
  ]
end
