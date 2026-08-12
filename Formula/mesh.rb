class Mesh < Formula
  desc "AI-native service mesh CLI for distributed agent orchestration"
  homepage "https://github.com/SteerMesh/steermesh"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.2.0/mesh-darwin-arm64.tar.gz"
      sha256 "c756e0da683d878cc35bc9e4259e31f2dfd3313707126a400de74926a9f1bf1b"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.2.0/mesh-darwin-amd64.tar.gz"
      sha256 "297e5bcbbbb89a6334b9e3a8f76d70ff5b86949a9643e332dea54dbe99db0c98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.2.0/mesh-linux-arm64.tar.gz"
      sha256 "297e5bcbbbb89a6334b9e3a8f76d70ff5b86949a9643e332dea54dbe99db0c98"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.2.0/mesh-linux-amd64.tar.gz"
      sha256 "53e55b0d8305c6ef1a38c49886c4c0cd5db7aab1ac11c13fea284e3864ef0966"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
