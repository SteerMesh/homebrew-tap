class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.14.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.6/mesh-darwin-arm64.tar.gz"
      sha256 "e8eb43458589893e3f39a2114007614fac4081484f12914ae43851ac07095aad"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.6/mesh-darwin-amd64.tar.gz"
      sha256 "d11f53642a355014e1b3d9b08ea38265285ff5e0aca888b4465aa995fbaf2c50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.6/mesh-linux-arm64.tar.gz"
      sha256 "7831074f660a7e9e26b068088eef0c0c326e6d887584447436e2c849ba8c6772"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.6/mesh-linux-amd64.tar.gz"
      sha256 "9a9939caee1d25f010404a6745aecdf0be037d3825a749b33930816e31e8938f"
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
