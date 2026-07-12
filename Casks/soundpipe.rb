cask "soundpipe" do
  version "1.0.13"
  sha256 "553d720b4518a1c237c2e0d568ff375bb855a14dbb40555f3cb8b7dadd140943"

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
