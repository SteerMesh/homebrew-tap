class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.17.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.8/mesh-darwin-arm64.tar.gz"
      sha256 "855a7eab38dd9c4cb24c51cc06e4c426b563f9a85b500b43f5c009e565c5963a"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.8/mesh-darwin-amd64.tar.gz"
      sha256 "509f3184aeb3593a547e6304edb1a5e1bcf7ce3e9745d0b6554ff08c5821fb5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.8/mesh-linux-arm64.tar.gz"
      sha256 "42cfbbf364d27ae5aec93a2c651e4cf0a420443614625c9804cba01974a023f1"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.8/mesh-linux-amd64.tar.gz"
      sha256 "5525ffb8524d49e65beffa0cf88030ad11745769a8a18a30cc34bfde46e5ffbd"
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
