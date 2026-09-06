cask "dominion525-blip" do
  version "0.2.1"
  sha256 "fd07c6fd65ab39d6e9ce1cdc5120f23e8c0a76f8a2963968bbc3de2c4e4d63a3"

  url "https://github.com/dominion525/blip/releases/download/v#{version}/Blip-#{version}.zip"
  name "Blip"
  desc "Menu bar utility that highlights the mouse cursor"
  homepage "https://github.com/dominion525/blip"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura
  depends_on arch: :arm64

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
