class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.0/mesh-darwin-arm64.tar.gz"
      sha256 "e91b8c7eecbbc6e1737bac7e14411f71f49284c306c982fc94255cb3c935945d"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.0/mesh-darwin-amd64.tar.gz"
      sha256 "52a37de439a7f7773e378619111bfb05ca8d885396b9c7d648de8ba34493cc81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.0/mesh-linux-arm64.tar.gz"
      sha256 "68a611a6c475dda89e023f5ee7dabc5aa8ec758b5f7eb1d93508fe05f64fe786"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.0/mesh-linux-amd64.tar.gz"
      sha256 "01d5ed8dd0390ead41ab873633413195c1cc4c5b37192b26e28c002ecd4ddb49"
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
