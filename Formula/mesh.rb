class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.0/mesh-darwin-arm64.tar.gz"
      sha256 "947e97530afbfe047b981f61a12db7b4f2cb6c9cacf68b8d54ba436a7566436e"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.0/mesh-darwin-amd64.tar.gz"
      sha256 "fc5fe805fca1b2a07400f47fee75b6398742233eb58811877a9040fdcfac0a5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.0/mesh-linux-arm64.tar.gz"
      sha256 "d4a270c70b886d72046ea3e10956239a7271efe55bc5b1cd5608784f5795000b"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.0/mesh-linux-amd64.tar.gz"
      sha256 "026a6822c5c6034419c40743e67268fe6db9bb563602acf67266d44aada36f33"
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
