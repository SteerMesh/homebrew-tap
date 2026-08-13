class Meshnet < Formula
  desc "Networking layer for SteerMesh distributed agent topology"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-darwin-arm64.tar.gz"
      sha256 "a98e124afff861b6d5136db6812f90ac46b52d0b6dd013fd7f2d0e2dd58ddf1c"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-darwin-amd64.tar.gz"
      sha256 "66906727c8ae6c0996782e005d3ea5d6b4ab1b9bac9d94acc06a5a4e6302e177"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-linux-arm64.tar.gz"
      sha256 "43008c16dc344a2f27fc78eb46c104fcc017569a6c12a589fbb8c32d84e55d0d"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-linux-amd64.tar.gz"
      sha256 "cb818ec7f0a8c12ab8989b3d47b00793545d5d6ad83556ce3ce6c0fc67920f78"
    end
  end

  def install
    bin.install "meshnet"
  end

  test do
    assert_match "meshnet version", shell_output("#{bin}/meshnet --version")
  end
end
