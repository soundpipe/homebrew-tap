# SoundPipe Homebrew Tap

[SoundPipe](https://soundpipe.app/) is an audio-routing app for macOS: create
virtual audio devices, capture app or system audio, and monitor to any output.

## Install

```sh
brew install --cask soundpipe/tap/soundpipe
```

Requires macOS 14 (Sonoma) or later. On first launch, SoundPipe installs its
virtual audio driver (one admin prompt).

## Updates

SoundPipe updates itself via its built-in updater, so `brew upgrade` leaves it
alone by default. The cask here is bumped automatically on every release.

## Uninstall

```sh
brew uninstall --cask soundpipe        # removes the app, stops the service
brew uninstall --cask --zap soundpipe  # also removes settings and logs
```

The virtual audio driver in `/Library/Audio/Plug-Ins/HAL` is not removed by
`brew uninstall` (it requires admin rights).
