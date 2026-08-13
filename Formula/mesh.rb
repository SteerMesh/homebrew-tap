class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.5/mesh-darwin-arm64.tar.gz"
      sha256 "204981b655250951640d77fe68705f19672982cbafd8460057ef52266afcfed8"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.5/mesh-darwin-amd64.tar.gz"
      sha256 "1d749d07fe97dc7fa9a51fe9ae7bfdbf26d2f7f3192be7ffc0c519c7c72aca63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.5/mesh-linux-arm64.tar.gz"
      sha256 "949308b3361bff5db8e3f97013217f8c329eda3a9878bf29f2d947a062825d13"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.5/mesh-linux-amd64.tar.gz"
      sha256 "f4997ecbf81b835d63c622fec7475fa3b2e069680108e8b0c3131d4688d3b09d"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
