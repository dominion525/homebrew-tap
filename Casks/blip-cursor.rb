cask "blip-cursor" do
  version "0.3.0"
  sha256 "e0ae9ab2b0d88cbe6789fcf7000229fb5d57cd639b337630211c22217fe92b53"

  url "https://github.com/dominion525/blip/releases/download/v#{version}/Blip-#{version}.zip"
  name "Blip"
  desc "Menu bar utility that highlights the mouse cursor"
  homepage "https://github.com/dominion525/blip"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Blip updates itself through Sparkle, so its own updater can leave Homebrew's installation
  # record older than the app on disk. This tells brew to read the installed bundle's version
  # rather than that record, which keeps brew upgrade from walking the app backwards.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Blip.app"

  zap trash: [
    "~/Library/Preferences/com.dominion525.blip.plist",
    "~/Library/Saved Application State/com.dominion525.blip.savedState",
  ]

  caveats <<~CAVEATS
    The modifier double-tap watches key events to tell left from right, which needs the
    Input Monitoring permission. macOS asks on first launch; enable Blip under
    System Settings > Privacy & Security > Input Monitoring.

    Launch at login is registered with SMAppService, which brew cannot remove. Turn it off
    in the settings window, or under System Settings > General > Login Items, before
    uninstalling.
  CAVEATS
end
