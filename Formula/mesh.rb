class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.12.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.4/mesh-darwin-arm64.tar.gz"
      sha256 "0a9609c0e1ba57550ac9a048d0196750831b1528efe6219fbcd5e7d59e9669ff"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.4/mesh-darwin-amd64.tar.gz"
      sha256 "906d401d4433eaaf7da81f3a25d56f8d5b64b1553e45a1d4bc3e4fe90386764a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.4/mesh-linux-arm64.tar.gz"
      sha256 "7250f18736bcd4605ce2529ac9dc44f5f00fbe74ed057150046f44aa82b12dbc"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.4/mesh-linux-amd64.tar.gz"
      sha256 "446720ee2f3b1c3a0e73b611b2ebd17375034c2dd53c0ec7b45df391e0d0ab71"
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
