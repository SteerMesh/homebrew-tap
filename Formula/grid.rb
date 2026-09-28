class Grid < Formula
  desc "P2P compute node for SteerMesh (successor to meshnet/meshgrid)"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-darwin-arm64.tar.gz"
      sha256 "5ec7346cad27ea2c146055d53da3d4445a083b7e16c2e33045faf5c46dcd5547"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-darwin-amd64.tar.gz"
      sha256 "a69c71f9eefdb31776d1a5d51eaba9759468bc18d8dbcabefbf3ae139aa18e32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-linux-arm64.tar.gz"
      sha256 "f9d67485bd6e1c1b7ea3dbab7c5f35262a512ce9a6b64161ba389d97325c73bc"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-linux-amd64.tar.gz"
      sha256 "4a7446aa936ad5168c5ec66f084368544378c4f317e2d21f0779f25c0e37ee06"
    end
  end

  def install
    bin.install "grid"
  end

  test do
    assert_match "grid version v0.1.2", shell_output("#{bin}/grid --version")
  end
end
