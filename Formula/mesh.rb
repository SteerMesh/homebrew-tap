class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.16.0/mesh-darwin-arm64.tar.gz"
      sha256 "81c9c3391aa84d968be43a07838befe08d710567ef782250a6b30bc4333520e2"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.16.0/mesh-darwin-amd64.tar.gz"
      sha256 "fb1386ef68d735d1fc77f71405b3de05c7589fcfd8dbe5ddba5f4cdd2050f016"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.16.0/mesh-linux-arm64.tar.gz"
      sha256 "60fca58f95b3b907a60e3cc4fa1790ce3708b562fddb21d53f936ca8462486d1"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.16.0/mesh-linux-amd64.tar.gz"
      sha256 "963d85ac3fa370140b702102ffc131ec1a9d50229e05d144ff8fee581625d894"
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
