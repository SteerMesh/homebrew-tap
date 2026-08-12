class Meshnet < Formula
  desc "Networking layer for SteerMesh distributed agent topology"
  homepage "https://github.com/SteerMesh/steermesh"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/meshnet-v0.1.0/meshnet-darwin-arm64.tar.gz"
      sha256 "1a94e8eb38dc21b9c69ec06a9aefdf85463e4c1c488436a306d52a2e4cd12710"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/meshnet-v0.1.0/meshnet-darwin-amd64.tar.gz"
      sha256 "867c2c7324f36a301a44fe12aea3b4640ba8bfdd66bba60f729316c2fb09689b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/meshnet-v0.1.0/meshnet-linux-arm64.tar.gz"
      sha256 "5dbba6b9cb3dfd71ec8140452c92981168887e9257b269d5593152dbd33c748f"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/meshnet-v0.1.0/meshnet-linux-amd64.tar.gz"
      sha256 "867c2c7324f36a301a44fe12aea3b4640ba8bfdd66bba60f729316c2fb09689b"
    end
  end

  def install
    bin.install "meshnet"
  end

  test do
    assert_match "meshnet version", shell_output("#{bin}/meshnet --version")
  end
end
