class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.14.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.2/mesh-darwin-arm64.tar.gz"
      sha256 "bf887088f60e8d3656957948409252a5741055f6facc43d2b1aa9fc0ea0ba287"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.2/mesh-darwin-amd64.tar.gz"
      sha256 "b75e80826003f58febb4b76df7e195904542da35f8025029c2459d3bf109c500"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.2/mesh-linux-arm64.tar.gz"
      sha256 "7d656d0c839474ddd1bab59e34442ff11c964189b9ba4b56847a461d9ff8a46e"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.2/mesh-linux-amd64.tar.gz"
      sha256 "9cd225a34a2520c1cbfe53f8f38d7ce17519171ceae5e9a8aa08bdce43731d8a"
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
