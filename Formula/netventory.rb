class Netventory < Formula
  desc "Network inventory and discovery tool"
  homepage "https://github.com/ramborogers/netventory"
  version "0.4.0n"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/netventory/releases/download/0.4.0n/netventory-darwin-amd64"
      sha256 "435556a4fce045ff015f758e6930631fa09e729272e0e27dbec2d9e62870da4f" # amd64
    else
      url "https://github.com/ramborogers/netventory/releases/download/0.4.0n/netventory-darwin-arm64"
      sha256 "83609e9a4a9fc37b10bb74c9ec19712edc1460f20a511919feece3f85fc0832d" # arm64
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "netventory-darwin-amd64" => "netventory"
    else
      bin.install "netventory-darwin-arm64" => "netventory"
    end
    # Remove quarantine attribute
    system "xattr", "-d", "com.apple.quarantine", "#{bin}/netventory"
  rescue
    # Ignore if xattr fails (in case attribute doesn't exist)
    nil
  end

  test do
    system "#{bin}/netventory", "--version"
  end
end
