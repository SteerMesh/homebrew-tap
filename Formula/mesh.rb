class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.1/mesh-darwin-arm64.tar.gz"
      sha256 "c8ccb4e007f34907afd1a505c3ce19b94c8dfc9e893ab270b5696cb99b3d08ab"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.1/mesh-darwin-amd64.tar.gz"
      sha256 "9e15263041931fdca79a6bf95c7d5f1cda056c534c6b8d43089ec5965bfe2347"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.1/mesh-linux-arm64.tar.gz"
      sha256 "e5332916d7a9c68bb7cd23e25c4545db438cd679b61ef1412d44bb064906a23b"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.1/mesh-linux-amd64.tar.gz"
      sha256 "c069e5ccdad19aae1dc88a192b14fc7a1dd68c84863902e5ae3b6c7d478dac73"
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
