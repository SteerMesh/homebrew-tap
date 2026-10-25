class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.1/mesh-darwin-arm64.tar.gz"
      sha256 "aef24c9f095e8c515fbf234bbf822eaf9bcc0eccf4c913abe83b0c03f10b69f8"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.1/mesh-darwin-amd64.tar.gz"
      sha256 "5900077e3f2236eeffa55c5fde30e9442202ca8c70c0ff239b23798db62753ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.1/mesh-linux-arm64.tar.gz"
      sha256 "1f3ec7c8b22dec58331a9fa12f94f45d07192cfaa1e31e58370a96a3f68ad764"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.1/mesh-linux-amd64.tar.gz"
      sha256 "a19c4e9c7fcef4973e6df913faf0aa906736684e2e231242ec50ae62fc9b7825"
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
