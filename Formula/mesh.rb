class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.7/mesh-darwin-arm64.tar.gz"
      sha256 "7905ae1fa56bb7d31758bc52e2a25aef3ce779b0d4d470e4363bfe920e884005"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.7/mesh-darwin-amd64.tar.gz"
      sha256 "169def33ad159ab08a3779b10f4885db3f021403e51689be4945d71ae1204b68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.7/mesh-linux-arm64.tar.gz"
      sha256 "53192601b5583f15c8a8b58a50df327329df00616c3e608cdbc6e50f1da9aa73"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.7/mesh-linux-amd64.tar.gz"
      sha256 "1fa9019e6990eb4608f52c858700059ba37a67c87e7830a97468b7fa6930e20e"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
