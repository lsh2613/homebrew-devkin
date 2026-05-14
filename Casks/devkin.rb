cask "devkin" do
  version "0.1.0"

  on_arm do
    sha256 "d387cfa98796e45ac665d3f7ec202666fd2e83659c3d6af11d24962ccb99be0c"
    url "https://github.com/lsh2613/devkin-release/releases/download/v#{version}/DevKin-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "3b8cbbbf27335baba045be48f0436a9dc5e613265d0ef449a4b58dc972233ed3"
    url "https://github.com/lsh2613/devkin-release/releases/download/v#{version}/DevKin-#{version}-x64.dmg"
  end

  name "DevKin"
  desc "macOS toolbox for developers (JSON, Byte, Base64, JWT, SQL, Markdown, HTML, Text)"
  homepage "https://github.com/lsh2613/devkin-relase"

  auto_updates false

  app "DevKin.app"

  zap trash: [
    "~/Library/Application Support/DevKin",
    "~/Library/Preferences/com.devkin.app.plist",
    "~/Library/Saved Application State/com.devkin.app.savedState",
  ]
end
