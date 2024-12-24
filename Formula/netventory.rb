class Netventory < Formula
  desc "Network inventory management tool with CLI, GUI and TUI interfaces"
  homepage "https://github.com/RamboRogers/netventory"
  version "0.2.0n"

  if Hardware::CPU.intel?
    url "https://github.com/RamboRogers/netventory/releases/download/v0.2.0n/netventory-darwin-amd64"
    sha256 "b0ae0873f6238c49a214e19df60371dfed24442cb868008a65c2507a7ba0788d"
  else
    url "https://github.com/RamboRogers/netventory/releases/download/v0.2.0n/netventory-darwin-arm64"
    sha256 "6056e45bfc69fac98618b9141ef859b14e3ff01e24400ada38088975e9e24ed6"
  end

  def install
    bin.install "netventory-darwin-amd64" => "netventory" if Hardware::CPU.intel?
    bin.install "netventory-darwin-arm64" => "netventory" if Hardware::CPU.arm?
  end

  test do
    system bin/"netventory", "--help"
  end
end
