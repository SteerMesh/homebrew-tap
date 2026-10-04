class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.9.2/mesh-darwin-arm64.tar.gz"
      sha256 "bfeff071572b2c2d99c97e51195484514bc5a029b8996f3df8d3e97e11798949"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.9.2/mesh-darwin-amd64.tar.gz"
      sha256 "9f0eb7224e11f0ae5d07543ff1dd8a534148d5e4b91f99bd19e03523554f7790"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.9.2/mesh-linux-arm64.tar.gz"
      sha256 "0bc3159d987b60fabc809af998a0ae492db88133fbb706a745cbbbfc8e80ee9e"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.9.2/mesh-linux-amd64.tar.gz"
      sha256 "ab52a0d3cc2665233c95eed0920ca8e18c1f33b2bce6f2fa398c0342bb9333c6"
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
