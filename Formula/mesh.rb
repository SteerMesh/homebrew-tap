class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.2/mesh-darwin-arm64.tar.gz"
      sha256 "ee941d1f6f489cb202f71a305feb99a94d4f506c89f8aebaf770c67782364b0b"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.2/mesh-darwin-amd64.tar.gz"
      sha256 "eebf5168f0a6b98b3dc11d3455e6e0fe58258f2d902fbfddd0b1d92127995dbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.2/mesh-linux-arm64.tar.gz"
      sha256 "78adf7d7d3f895d172fb01917d72e80300c01458ec734494314342bb016ea433"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.2/mesh-linux-amd64.tar.gz"
      sha256 "208cc6d3a3aca3ea85199edec66378fc2bb2387f00296d32f65befff74c22f67"
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
