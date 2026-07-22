cask "devkin" do
  version "1.3.2"

  on_arm do
    sha256 "261ea4c7067261b43e70460b641a661c555f223322eb46d89142c57aff054297"
    url "https://github.com/lsh2613/homebrew-devkin/releases/download/v#{version}/DevKin-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "43eff7b636d152da3764ed095403df827f2cddbb5ee88013708e00252437e4c7"
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
