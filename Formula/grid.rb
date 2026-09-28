class Grid < Formula
  desc "P2P compute node for SteerMesh (successor to meshnet/meshgrid)"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-darwin-arm64.tar.gz"
      sha256 "0cb24e0d0594da1407d8a33956e20e79d342e1bf40c800e85c4a9db8e02367b8"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-darwin-amd64.tar.gz"
      sha256 "f10ae7df3b36f48536b68d44b0096d16b5ecf2641eea7cec187f26b32651f931"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-linux-arm64.tar.gz"
      sha256 "49d2937405e4053fba06e6d9241d0b7cc9cfc721c49b6e881d9f0033bb862d58"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/grid-v0.1.3/grid-linux-amd64.tar.gz"
      sha256 "6f02b4b016b40edd7f06093e88af214a9afa451b00ec319943cdd282a5fc620a"
    end
  end

  def install
    bin.install "grid"
  end

  test do
    assert_match "grid version v0.1.2", shell_output("#{bin}/grid --version")
  end
end
