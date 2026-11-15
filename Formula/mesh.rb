class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.17.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.5/mesh-darwin-arm64.tar.gz"
      sha256 "8631a3829edd1b1dc674b7727a630af229df7f70fb030a8689eb9d4d6367e6ef"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.5/mesh-darwin-amd64.tar.gz"
      sha256 "9370e3e56e065c1379d33ec5c223d9d77b8da369cf356221d1d6f5d18b521dea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.5/mesh-linux-arm64.tar.gz"
      sha256 "4ce457eab8672974c0f053402903e7a3b18c61a4fb1a93b2949dafa52b41f4c4"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.5/mesh-linux-amd64.tar.gz"
      sha256 "ca77e350334dc0684bb8f8f8c61c043f809686c867e92500ddd31330484d04d6"
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
