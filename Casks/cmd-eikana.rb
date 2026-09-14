cask "cmd-eikana" do
  version "2.5.2"
  sha256 "985c271556dd383d17eaf7fa2e9e64f4a79f94d475c41219f69efa587f779b98"

  url "https://github.com/dominion525/cmd-eikana/releases/download/v#{version}/cmd-eikana-v#{version}-arm64.zip"
  name "⌘英かな"
  desc "Switch input sources with the left and right Command keys"
  homepage "https://eikana.dominion525.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself through Sparkle, so its own updater can leave Homebrew's installation
  # record older than the app on disk. This tells brew to read the installed bundle's version
  # rather than that record, which keeps brew upgrade from walking the app backwards.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "⌘英かな.app"

  # The app keeps running in the menu bar, so quit it before the bundle is replaced or removed.
  uninstall quit: "io.github.dominion525.cmd-eikana"

  zap trash: "~/Library/Preferences/io.github.dominion525.cmd-eikana.plist"

  caveats <<~CAVEATS
    Remapping keys needs the Accessibility and Input Monitoring permissions. macOS asks on
    first launch; enable ⌘英かな under System Settings > Privacy & Security > Accessibility
    and > Input Monitoring.

    Launch at login is registered through a helper inside the app, which brew cannot remove.
    Turn it off in the settings window, or under System Settings > General > Login Items,
    before uninstalling.
  CAVEATS
end
