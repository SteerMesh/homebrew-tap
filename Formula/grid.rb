class Grid < Formula
  desc "P2P compute node for SteerMesh (successor to meshnet/meshgrid)"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-darwin-arm64.tar.gz"
      sha256 "cd8edc6518d742c44b6719211960134abf75bed2538eb20ce3f500ea71363f11"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-darwin-amd64.tar.gz"
      sha256 "5b07dc9be746c92d0a654f2206b06a2de94b5fadde506f0649244e0b9cb629c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-linux-arm64.tar.gz"
      sha256 "5e416a38f94a87a9d760af93e0a2b0d32e01dfd94dd71ddf371d3572aef6e70d"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-linux-amd64.tar.gz"
      sha256 "d12a84937c57e477f82133529adbc63d2e4ae5d2c2258f36cd600b7bb3bae4ab"
    end
  end

  def install
    bin.install "grid"
  end

  test do
    assert_match "grid version v0.1.2", shell_output("#{bin}/grid --version")
  end
end
