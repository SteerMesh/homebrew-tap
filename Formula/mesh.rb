class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.17.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.2/mesh-darwin-arm64.tar.gz"
      sha256 "6778f8618f5aa0222a08a945280facf4cb152dbca1365de25f65d1dd1a3dd3bb"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.2/mesh-darwin-amd64.tar.gz"
      sha256 "3fb425052c6937d0e0ab195e5dea672e09656cf3e5323efadc26a9c26fd694e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.2/mesh-linux-arm64.tar.gz"
      sha256 "a6ba70b1e79e0fecf0233cdedfa1e108de2a132998dfc2b5db1b839759e035e1"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.2/mesh-linux-amd64.tar.gz"
      sha256 "901f6c0cdc2a8261f665a7138316f6ed5c50d60788c74a5992452cd3ef706452"
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
