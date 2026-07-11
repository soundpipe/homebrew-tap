cask "soundpipe" do
  version "1.0.12"
  sha256 "ec7faebe4fe5157ff9f450771fd979955553b6910b382afe0f48bae8f7d65ab3"

  url "https://soundpipe.app/downloads/SoundPipe-#{version}.dmg"
  name "SoundPipe"
  desc "Audio routing: virtual devices, app capture, and monitoring"
  homepage "https://soundpipe.app/"

  livecheck do
    url "https://soundpipe.app/updates/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "SoundPipe.app"

  uninstall launchctl: "app.soundpipe.service",
            quit:      "app.soundpipe.mac"

  zap trash: [
    "~/Library/Application Support/SoundPipe",
    "~/Library/LaunchAgents/app.soundpipe.service.plist",
    "~/Library/Logs/SoundPipe",
    "~/Library/Preferences/app.soundpipe.mac.plist",
  ]

  caveats <<~EOS
    SoundPipe installs its virtual audio driver on first launch
    (one admin prompt). Uninstalling the cask does not remove the
    driver from /Library/Audio/Plug-Ins/HAL.
  EOS
end
