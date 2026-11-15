class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.17.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.4/mesh-darwin-arm64.tar.gz"
      sha256 "d3423814bd124a16790e708ca9b8f122f95a43de72d109d7697e83efa43668d1"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.4/mesh-darwin-amd64.tar.gz"
      sha256 "af6b45e09e371fd0a8dacdcd33c848028bdb05931255a49a13a73c37f2fcc076"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.4/mesh-linux-arm64.tar.gz"
      sha256 "772f62ebea3c03520408648860bd41553a138dff4f6ae24baba4c1d1e941881c"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.4/mesh-linux-amd64.tar.gz"
      sha256 "fb434e08f33bb7417317ef12789937e3bb9a9025948bd115b778f3c3cc485686"
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
