cask "netventory" do
  version "0.4.0n"
  sha256 "155ff340632a44402a2fed0d1ab9a97372baaa20eeab23e94bcc2458b45dfddf"

  url "https://github.com/ramborogers/netventory/releases/download/#{version}/netventory.mac.zip"
  name "Netventory"
  desc "Network inventory and discovery tool"
  homepage "https://github.com/ramborogers/netventory"

  app "Netventory.app"

  zap trash: [
    "~/Library/Application Support/Netventory",
    "~/Library/Preferences/com.netventory.app.plist",
    "~/Library/Saved Application State/com.netventory.app.savedState"
  ]
end