class Grid < Formula
  desc "P2P compute node for SteerMesh (successor to meshnet/meshgrid)"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.4.0/grid-darwin-arm64.tar.gz"
      sha256 "3854bb4acdd7f359af1353eb594b27cbc6b1530aabbb590d8374701cb6f424e4"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.4.0/grid-darwin-amd64.tar.gz"
      sha256 "97aa70f8f91a0fae735f34992b4fd7744d4bb2461da114cb58276c10c95204f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.4.0/grid-linux-arm64.tar.gz"
      sha256 "470d347b8328a47ff7188b3d8d044768f59f0cc7d43de503cfe8806ef793b684"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.4.0/grid-linux-amd64.tar.gz"
      sha256 "519ebf7fabab0edce389cde6f995864336ae973e40e6adf176366be3214efbd5"
    end
  end

  def install
    bin.install "grid"
  end

  test do
    assert_match "grid version v0.1.2", shell_output("#{bin}/grid --version")
  end
end
