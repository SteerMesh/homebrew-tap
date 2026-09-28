class Meshgrid < Formula
  desc "P2P compute node for SteerMesh (successor to meshnet)"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshgrid-v0.1.0/meshgrid-darwin-arm64.tar.gz"
      sha256 "3917ed08231c85e609ac4c202c6d87eac8bc716e059cbc5cab1ef478090ab6ee"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshgrid-v0.1.0/meshgrid-darwin-amd64.tar.gz"
      sha256 "01dc5a42c2cf7d4f190d5247df827ce66f2b5657f02961ed7289f95c7bb57416"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshgrid-v0.1.0/meshgrid-linux-arm64.tar.gz"
      sha256 "3872f8e310c40a7cac82cca3012d7eee4989090905feb89698d6e34ec9e49600"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshgrid-v0.1.0/meshgrid-linux-amd64.tar.gz"
      sha256 "f63ae908904e429caf3995559c1a8d483c4cb710c884bc217aba0a7c07362926"
    end
  end

  def install
    bin.install "meshgrid"
  end

  test do
    assert_match "meshgrid version v0.1.0", shell_output("#{bin}/meshgrid --version")
  end
end
