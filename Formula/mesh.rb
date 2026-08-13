class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.1/mesh-darwin-arm64.tar.gz"
      sha256 "d0a2c42b87769c8f29cdb55370f8d7385fee62aeace88c2647aa3dde4f87d2a6"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.1/mesh-darwin-amd64.tar.gz"
      sha256 "96a356b76b35a310ca1d205f9bbe0d9fab33ee17dea0a5fcfbecf33c9c42f981"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.1/mesh-linux-arm64.tar.gz"
      sha256 "dbb6cd94d91b48d4a419d2e61808253747c4123294fc640e33923a764f4dddec"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.1/mesh-linux-amd64.tar.gz"
      sha256 "fdf5ba555d9f537ffd7a545f1b3dc4e049d90e0e9d5db726462261a20c7d9fbf"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
