class Meshnet < Formula
  desc "Networking layer for SteerMesh distributed agent topology"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-darwin-arm64.tar.gz"
      sha256 "1e813dae1f4f73ec8b7f4509d7bb59e2dc40432f9fe47bc53414aadb60252e52"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-darwin-amd64.tar.gz"
      sha256 "db31d2d016bf91e03014e8c55f6e996e5d0d072d5cdf247f0f61f29ea52a9b2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-linux-arm64.tar.gz"
      sha256 "451ed79cc6774369b22d5b0f321fbb3ee5aed4f9660d143696c683fd349acc61"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-linux-amd64.tar.gz"
      sha256 "43c0097ee955d19ed1ad472321b0fb92fdbb56c5e3c3079572c9fd7b974e7c20"
    end
  end

  def install
    bin.install "meshnet"
  end

  test do
    assert_match "meshnet version", shell_output("#{bin}/meshnet --version")
  end
end
