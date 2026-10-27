class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.14.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.4/mesh-darwin-arm64.tar.gz"
      sha256 "e7f9e196b28aa8c3d87f8559ac50e1ec59aa541c9b8c552c76f80d7558b8b3d3"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.4/mesh-darwin-amd64.tar.gz"
      sha256 "399a890ce4768317770dc36b33e64feecf45bf08ef5270491eb6b3a1c6d6365f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.4/mesh-linux-arm64.tar.gz"
      sha256 "175554791771ca56809966a12e1ba4ab1f8bd855f60f7553eb5bf729547b831f"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.4/mesh-linux-amd64.tar.gz"
      sha256 "254ef4a27e0d3b2f9df95c077c87d989fab17b7c8fb2f9c852c4a674a0b6d173"
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
