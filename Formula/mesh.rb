class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.1/mesh-darwin-arm64.tar.gz"
      sha256 "6030bc8d5a387860c1d34c78c6844c980e2dd55d1414ee128a56dafaafd03fbc"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.1/mesh-darwin-amd64.tar.gz"
      sha256 "73e3d31bc751425a1fff0e6856fd103c2ba7fb33fb536fced124a2599b54b894"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.1/mesh-linux-arm64.tar.gz"
      sha256 "b911297934a1a5b6df7d61491b5f5aa54c0b0d42a16ac6a7da8e4cba8ceb1a5d"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.1/mesh-linux-amd64.tar.gz"
      sha256 "c0aba3675f517e189df0fc77ce44239a72419237ee863bea22a59d1729db19e8"
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
