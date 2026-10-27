class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.0/mesh-darwin-arm64.tar.gz"
      sha256 "d705d632b9e43a3470a0fbc352035a05834544fc20d5534f0ec900f7e66b45b1"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.0/mesh-darwin-amd64.tar.gz"
      sha256 "7aab4a4736ffd54a62e51900d26ae935a7fd727616e2c9463139ad973ce66df4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.0/mesh-linux-arm64.tar.gz"
      sha256 "2f0256530d40d4d7080be2148a690d42ae1d0b810dc6756dfbdc8184d23b87a0"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.0/mesh-linux-amd64.tar.gz"
      sha256 "2a62203bf28938cb9d60f98750b09e8c83199eaa0a5bfebcd9d52890a87d5691"
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
