class Grid < Formula
  desc "P2P compute node for SteerMesh (successor to meshnet/meshgrid)"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.2/grid-darwin-arm64.tar.gz"
      sha256 "ced0934fda4ff5b9d0186f8068ab9d8daad3a350079b7c61798580849864be0d"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.2/grid-darwin-amd64.tar.gz"
      sha256 "4a0549eb5da0902beb9c8a4f19f8594708d22ed202669a8fb09774949e0007fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.2/grid-linux-arm64.tar.gz"
      sha256 "e191f1fff45e33a4b8e025527157b08014009abc1420377b9fb8cf076981ad2f"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.2/grid-linux-amd64.tar.gz"
      sha256 "91704c821b8bd3e0b11a33ba10dd9386b113d381da73268fdbf71155c62b79f5"
    end
  end

  def install
    bin.install "grid"
  end

  test do
    assert_match "grid version v0.1.2", shell_output("#{bin}/grid --version")
  end
end
