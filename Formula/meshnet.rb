class Meshnet < Formula
  desc "Networking layer for SteerMesh distributed agent topology"
  homepage "https://github.com/SteerMesh/steermesh"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/meshnet-v0.1.0/meshnet-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/meshnet-v0.1.0/meshnet-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/meshnet-v0.1.0/meshnet-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/meshnet-v0.1.0/meshnet-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "meshnet"
  end

  test do
    assert_match "meshnet version", shell_output("#{bin}/meshnet --version")
  end
end
