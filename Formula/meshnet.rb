class Meshnet < Formula
  desc "Networking layer for SteerMesh distributed agent topology"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.3.0/meshnet-darwin-arm64.tar.gz"
      sha256 "3b12b1d1eb459d43a490f45ddd80ab927716731aef7828588615d48cea7ac756"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.3.0/meshnet-darwin-amd64.tar.gz"
      sha256 "0143d20def6174db6b54a72b15cf52b1870b295455c467bad9f942700d253781"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.3.0/meshnet-linux-arm64.tar.gz"
      sha256 "6323c9de8b437d48e5cd83312c7ecd638c945928e960629e80bef165c47a3207"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.3.0/meshnet-linux-amd64.tar.gz"
      sha256 "899f3122413f8d1e94f3bf4b994860741c9b20dc6b16c31932cab2e1406660ba"
    end
  end

  def install
    bin.install "meshnet"
  end

  test do
    assert_match "meshnet version", shell_output("#{bin}/meshnet --version")
  end
end
