class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.8.0/mesh-darwin-arm64.tar.gz"
      sha256 "7589f1353a29aa7d17302d1b9c730f866bd05549f84613c22981c150d0ac1b5b"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.8.0/mesh-darwin-amd64.tar.gz"
      sha256 "d4ebcf39a72674489f36c86a27e2a03fcd43c4554dba553d32ed85e5fe5a74c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.8.0/mesh-linux-arm64.tar.gz"
      sha256 "b4d3856cecf16ba774916590e85d66c7fba8bca6ad54c0a08545cdd64605b009"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.8.0/mesh-linux-amd64.tar.gz"
      sha256 "50e59c4249e27c4949974eca9fa0d6fe5e1548fe24dfb7944e555a762afd98ca"
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
