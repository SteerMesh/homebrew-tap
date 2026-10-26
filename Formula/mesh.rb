class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.12.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.5/mesh-darwin-arm64.tar.gz"
      sha256 "7b6ff0b02b3ec726fb70010ddc88f6c34799a0b74d5b72788ab258945f2fbf67"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.5/mesh-darwin-amd64.tar.gz"
      sha256 "3608c8a99cc138d86f542efda955133dffc074e59fb8085a0f42dd0376642d2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.5/mesh-linux-arm64.tar.gz"
      sha256 "87e920ff26d3a71e8092512fdf70b5455a2b26a51310da0913edb8d65ebf266f"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.5/mesh-linux-amd64.tar.gz"
      sha256 "290f9d96993e7d00fb44e1332b7a4d3474d372dadacd3686236f1c479b52bc97"
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
