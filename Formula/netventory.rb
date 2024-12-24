class Netventory < Formula
  desc "Network inventory management tool with CLI, GUI and TUI interfaces"
  homepage "https://github.com/RamboRogers/netventory"
  version "0.2.0n"

  if Hardware::CPU.intel?
    url "https://github.com/RamboRogers/netventory/releases/download/v0.2.0n/netventory-darwin-amd64"
    sha256 "64eece9396df788dcc6d9fea445be613c0eade493215132d8722350631436104"
  else
    url "https://github.com/RamboRogers/netventory/releases/download/v0.2.0n/netventory-darwin-arm64"
    sha256 "3e6f0615e10b536339729874df68a136393b0b0e5a077efebe3febfdd6cb5ff8"
  end

  def install
    bin.install "netventory-darwin-amd64" => "netventory" if Hardware::CPU.intel?
    bin.install "netventory-darwin-arm64" => "netventory" if Hardware::CPU.arm?
  end

  test do
    system bin/"netventory", "--help"
  end
end
