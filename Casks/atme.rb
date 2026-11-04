cask "atme" do
  version "0.1.1"
  sha256 "e80491128cf0ae6caf4c536b2ee89a96985a275fc08aa50ddad15017980ec200"

  url "https://github.com/dominion525/atme/releases/download/v#{version}/atme-#{version}.zip"
  name "atme"
  desc "Menu bar list and notifications of Slack mentions and DMs meant for you"
  homepage "https://github.com/dominion525/atme"

  livecheck do
    url :url
    strategy :github_latest
  end

  # atme updates itself through Sparkle, so its own updater can leave Homebrew's installation
  # record older than the app on disk. This tells brew to read the installed bundle's version
  # rather than that record, which keeps brew upgrade from walking the app backwards.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "atme.app"

  zap trash: [
    "~/.config/atme",
    "~/.local/state/atme",
    "~/Library/HTTPStorages/com.dominion525.atme",
    "~/Library/Preferences/com.dominion525.atme.plist",
  ]

  caveats <<~CAVEATS
    Slack tokens are kept in the Keychain, which brew cannot remove. Remove each workspace
    in atme's Workspaces window before uninstalling, or delete the items named atme in
    Keychain Access.

    Open at Login is registered with SMAppService, which brew cannot remove. Turn it off
    in the menu, or under System Settings > General > Login Items, before uninstalling.
  CAVEATS
end
