class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.3/mesh-darwin-arm64.tar.gz"
      sha256 "29c41b931d112f6ad58d150806c0b39f038d72b13a0df5bbdbd29fdcabd6a01e"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.3/mesh-darwin-amd64.tar.gz"
      sha256 "be56aa6e6a8b8d811d46c53a8219eac608ef80f88f490957c369451d127da417"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.3/mesh-linux-arm64.tar.gz"
      sha256 "e5f371eac2395e1027189545810716ad3022f6adda9bfc6e34f05033f1840cf8"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.3/mesh-linux-amd64.tar.gz"
      sha256 "868c14cc1273ac857f726aa1e2ad508aab8f47de07af3e3f160de01affd40200"
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
