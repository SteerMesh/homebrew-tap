class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.4/mesh-darwin-arm64.tar.gz"
      sha256 "9df50718c1267463564407bb065b7fd0713403f3d2dd0186d7f8298c948a7c3f"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.4/mesh-darwin-amd64.tar.gz"
      sha256 "c872694c6a5dbc0081418fe3e0d85b04109c129263990f2e983d87d30edaa831"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.4/mesh-linux-arm64.tar.gz"
      sha256 "df6893886560c0f9b5cd03310f9d3ffe7e8ed8a9153af4fe8497a88aa2c8ea09"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.4/mesh-linux-amd64.tar.gz"
      sha256 "8f98b3ac3ee5339dc94d63f4b41b6a25f7181ebb7b19c58d79581d8140984075"
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
