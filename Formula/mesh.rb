class Mesh < Formula
  desc "AI-native service mesh CLI for distributed agent orchestration"
  homepage "https://github.com/SteerMesh/steermesh"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.2.0/mesh-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.2.0/mesh-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.2.0/mesh-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.2.0/mesh-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
