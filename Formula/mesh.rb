class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.17.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.1/mesh-darwin-arm64.tar.gz"
      sha256 "1c5d3015fa394b583f1125557f58559a917f15d1b92e2a4eaca18084c2d2a51a"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.1/mesh-darwin-amd64.tar.gz"
      sha256 "4016bfebed4d79d571e3d160af5faad8b1fc4b375b9755eaf737a30cf571b90e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.1/mesh-linux-arm64.tar.gz"
      sha256 "a0227924066486b2ce0346fecfaa468b952e26d8cb79a8598c84ecc9eb10a4b7"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.1/mesh-linux-amd64.tar.gz"
      sha256 "b20ebbd2ca3a6f762b0588ee68514b652ec52e5df90c0a7c069cd1f9400fc6ac"
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
