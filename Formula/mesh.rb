class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.1/mesh-darwin-arm64.tar.gz"
      sha256 "a2863728805f5e8579852e087b95c3bf7abb4501c43adbd8515c2a2529ff2602"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.1/mesh-darwin-amd64.tar.gz"
      sha256 "2a0b56290b3fc8d020b2a2f211a86ce86796addcaaed4c511426f14b8c1023d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.1/mesh-linux-arm64.tar.gz"
      sha256 "f2d8c1dd4c551a70a7dc66190e1a984a37c0f1e95e764aca5012a97a22e9ee34"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.1/mesh-linux-amd64.tar.gz"
      sha256 "953e0157b54aa1ee4eaf0fe772356a5b0d3536a00e807629331ef2b12c1d335c"
    end
  end

  def install
    bin.install "mesh"
    bin.install "mesh-updater" if File.exist?("mesh-updater")
  end

  test do
    assert_match "mesh", shell_output("#{bin}/mesh version")
  end
end
