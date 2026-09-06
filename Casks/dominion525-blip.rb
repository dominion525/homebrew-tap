cask "dominion525-blip" do
  version "0.1.1"
  sha256 "58ac70a83a28ff616b24fb0a4f08c0e62512533cf91265356a0340338dc4b9d3"

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
