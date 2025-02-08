class Netventory < Formula
  desc "Network inventory and discovery tool"
  homepage "https://github.com/ramborogers/netventory"
  version "0.4.0n"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/netventory/releases/download/0.4.0n/netventory-darwin-amd64"
      sha256 "8be634f82140276a6d398ff1b8e64d754bf0cc051c28b1ed6f62140684f876cf" # amd64
    else
      url "https://github.com/ramborogers/netventory/releases/download/0.4.0n/netventory-darwin-arm64"
      sha256 "4c35a3dd678fa4946c784e81477df5ebfae6aeae8c693c2353734f2618d4dde1" # arm64
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
