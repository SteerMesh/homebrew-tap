class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.11.0/mesh-darwin-arm64.tar.gz"
      sha256 "8a7b8d87f7ac7e38e8befa91a953d28883bf862a23f96ce1161bf7ee37892b2d"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.11.0/mesh-darwin-amd64.tar.gz"
      sha256 "85a46441e7069e848353924843909399d50611adeb3196b2b4e8e0c6460560e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.11.0/mesh-linux-arm64.tar.gz"
      sha256 "2bbaea7869578a4afed25d5b8074f5d0f29489d8a7cf66f79e705ce270cdade7"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.11.0/mesh-linux-amd64.tar.gz"
      sha256 "fb43851e1d411fcaac715499a9e6e919dd341d96658a347749f16feee6547879"
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
