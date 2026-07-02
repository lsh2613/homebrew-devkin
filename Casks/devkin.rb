cask "devkin" do
  version "1.3.1"

  on_arm do
    sha256 "5a5243b52fdbf0d6ac9667c2d77dac90c86f51e8aa5b857536e9ccea863a850b"
    url "https://github.com/lsh2613/homebrew-devkin/releases/download/v#{version}/DevKin-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "df681b72c766dd2d8aad8cf86e525dc84f86767a50538f38ab6a593d6a9e34c9"
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
