class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.6/mesh-darwin-arm64.tar.gz"
      sha256 "cb42c291312f37451a596a0f25fb2567542bf579a8d577adca6bb60e411c7e0d"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.6/mesh-darwin-amd64.tar.gz"
      sha256 "0c6b2be43998fadfc00c47bea24a9172e71372c9d49bbe409da60d00b0b541ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.6/mesh-linux-arm64.tar.gz"
      sha256 "ad641819bbfef19ee0fbbe7a81eb43b23f920f9e584e5c4606e92ce370c8c20f"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.6/mesh-linux-amd64.tar.gz"
      sha256 "30baa1229cc43eaf5cb4a2759e3219360942d4b4753fcd988a2862115808a011"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
