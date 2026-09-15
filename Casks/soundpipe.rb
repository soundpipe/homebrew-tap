cask "soundpipe" do
  version "1.0.14"
  sha256 "fe1006407b2293c530b3b99387a8aa12236d8b4184428d069ee5f2be77f63f9c"

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
