class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.17.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.7/mesh-darwin-arm64.tar.gz"
      sha256 "72f6970fc6e30ff1cc7ca1171a2bc76b48168777b49e60295c4343e1dbe80682"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.7/mesh-darwin-amd64.tar.gz"
      sha256 "929585dc521af56bc740230bd9fd654968ec0c91f03fb2b097559834d883bf7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.7/mesh-linux-arm64.tar.gz"
      sha256 "65558ffc7eb52395359443a033b7b8223c4bf2b4b328dca8c98c9d490ff9b264"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.7/mesh-linux-amd64.tar.gz"
      sha256 "9e4170285f576324e3268d87bb7e30cd4055330e1361fb8e463c5e829e808cc9"
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
