cask "soundpipe" do
  version "1.0.18"
  sha256 "b4d96cf05b4c47b8d368c8e8d3561ea952619e1f4fbcac9a92488a794f92dd5e"

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
