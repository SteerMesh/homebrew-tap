class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.13.1/mesh-darwin-arm64.tar.gz"
      sha256 "42743abe4c946f97b07d37d30a88ec51101cda8132ffb88bdfabdcfa312bb093"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.13.1/mesh-darwin-amd64.tar.gz"
      sha256 "b25b385e80528001720ae1d6c57c0ea37b5045a7c2ef2add9c3cb3bfcfe341f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.13.1/mesh-linux-arm64.tar.gz"
      sha256 "71776365c3c81da1b008392e4845753831ea31d8f254cb97493b609b6ab6384c"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.13.1/mesh-linux-amd64.tar.gz"
      sha256 "b19eab215e8283c1adeb365ca1631d709ab2ee8c7afac09861786b90c859ac1e"
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
