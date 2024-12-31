class Netventory < Formula
  desc "Network inventory and discovery tool"
  homepage "https://github.com/ramborogers/netventory"
  version "0.3.0n"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/netventory/releases/download/0.3.0n/netventory-darwin-amd64"
      sha256 "fea855f421a632353e6e7e3e4ea304044bea49613b74d45f2621080f046c056b" # amd64
    else
      url "https://github.com/ramborogers/netventory/releases/download/0.3.0n/netventory-darwin-arm64"
      sha256 "1046a11b9a7420120ce1ca9b0060f10b25028a8b3d3178bd6ebbf6842d34d825" # arm64
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
