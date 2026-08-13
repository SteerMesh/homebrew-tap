class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.3/mesh-darwin-arm64.tar.gz"
      sha256 "a2c5da035207a200c1e9c76b3f167670a5f4e0037434aa351e901da38f81875a"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.3/mesh-darwin-amd64.tar.gz"
      sha256 "ecb1d336724b26d6afbe2175df182405cdcf5d49f7f47276bc89cf8b272872aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.3/mesh-linux-arm64.tar.gz"
      sha256 "c7fc180bfc77f96d920ee29cc5a4846c7c4ab6049cc97bb5a213838b5dd8629d"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.3/mesh-linux-amd64.tar.gz"
      sha256 "f7612ca49b6f0308cde7fed9f192247f488594816be1d21dc9ee5300cd6f4bb5"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
