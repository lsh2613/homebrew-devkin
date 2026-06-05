cask "devkin" do
  version "1.2.3"

  on_arm do
    sha256 "ae9cef171f052b39c359ffca0fa001801231af442dc7dfc640d49f5c81512053"
    url "https://github.com/lsh2613/homebrew-devkin/releases/download/v#{version}/DevKin-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "3c39fe54283ce5ac35374dbe23c223ab9a4fca63ed080c6d5500b205dd86780d"
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
