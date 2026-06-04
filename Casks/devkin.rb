cask "devkin" do
  version "1.2.2"

  on_arm do
    sha256 "1c7ec7324bce50db6f6e35c3a0d5aaa42ad6242f4548ad0785b62cc1e280ed45"
    url "https://github.com/lsh2613/homebrew-devkin/releases/download/v#{version}/DevKin-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "6a086b102475dfcf80552102ca8a62b9c2a1599bbf9efb415cafd7ed12643320"
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
