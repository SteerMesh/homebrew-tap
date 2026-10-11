class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.0/mesh-darwin-arm64.tar.gz"
      sha256 "2cfdfdbf34d42061b6f048a435ad2f7efef17c15089a86b07636f163b9325106"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.0/mesh-darwin-amd64.tar.gz"
      sha256 "c30b894161eab97067306667033c696d60e0ee98a0443b362f6a7e09ace39cde"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.0/mesh-linux-arm64.tar.gz"
      sha256 "4ad48d1322ecbfe546d2a65131d6f8dd43fa6ebb6a068566fd199de6133a710f"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.0/mesh-linux-amd64.tar.gz"
      sha256 "6eb788267df5e38cf0e1651a9341b93c4fab9707c3a20e31a7fba46d16719d16"
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
