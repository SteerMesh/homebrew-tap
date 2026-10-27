class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.14.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.3/mesh-darwin-arm64.tar.gz"
      sha256 "e2a83d16deae8cabd153ccf881c3c2ab33f026413a7f4ee96882f6400c9bbacc"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.3/mesh-darwin-amd64.tar.gz"
      sha256 "1b93de1ae26f60243d9a0e0bb9befde21ccef8a7c04796df702f5925ff6fa5f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.3/mesh-linux-arm64.tar.gz"
      sha256 "673551c4dfef4f828e9bc423b323d1f9ce9468c59e5ba2937845f9945485e035"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.3/mesh-linux-amd64.tar.gz"
      sha256 "f2e6314430dd328393d55260f3ef7071644aeb9ff935b0446d7c77c92879cde8"
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
