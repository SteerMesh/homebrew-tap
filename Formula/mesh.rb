class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.9.1/mesh-darwin-arm64.tar.gz"
      sha256 "09710e9d8fae7faee69f31f022cb380b9b0545832e73590c479ffc558946c22f"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.9.1/mesh-darwin-amd64.tar.gz"
      sha256 "b951d4f2a86acdac74e8477bcdc7f068a28d06ba9201dd0b5736eaf08018b737"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.9.1/mesh-linux-arm64.tar.gz"
      sha256 "495deeffa5b5f4e908d7dcbb32115e7d1b450c1ce7365ff6f4f55e076a5236fc"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.9.1/mesh-linux-amd64.tar.gz"
      sha256 "474cd6ce28b3c878a7693f9a9baf60133c3b4907ea568f475eab46058accdfc5"
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
