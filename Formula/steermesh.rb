class Steermesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/steermesh"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.3.0/mesh-darwin-arm64.tar.gz"
      sha256 "6cc77b30e32aaf5d7f0693eaa423a804702d530ea0101f13a088a583b2cb37dc"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.3.0/mesh-darwin-amd64.tar.gz"
      sha256 "a48a273533743afc3d8fe138b04e1b35f48ab5dcee89c22b4267f6b8c636dec5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.3.0/mesh-linux-arm64.tar.gz"
      sha256 "7e22d42aa2bc47b06f588b3b292dda4971b92bc88c4f45f95a31a913c714e668"
    else
      url "https://github.com/SteerMesh/steermesh/releases/download/mesh-v0.3.0/mesh-linux-amd64.tar.gz"
      sha256 "ca629092e6510cc535e061bf684e1ebbccfa499612e4589aebbed6f2ff478dc7"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
