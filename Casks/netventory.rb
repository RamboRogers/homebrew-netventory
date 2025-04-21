cask "netventory" do
  version "0.4.0n"
  sha256 "ec1c59d457756eae9382cab0d149004bf8091496f6293833a32d4694b8d0d9ee"

  url "https://github.com/ramborogers/netventory/releases/download/#{version}/netventory.mac.zip"
  name "Netventory"
  desc "Network inventory and discovery tool"
  homepage "https://github.com/ramborogers/netventory"

  app "Netventory.app"

  postflight do
    system_command "/usr/bin/xattr",
                  args: ["-d", "com.apple.quarantine", "#{appdir}/Netventory.app"],
                  sudo: false
  rescue
    nil
  end

  zap trash: [
    "~/Library/Application Support/Netventory",
    "~/Library/Preferences/com.netventory.app.plist",
    "~/Library/Saved Application State/com.netventory.app.savedState"
  ]
end