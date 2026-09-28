class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.7.0/mesh-darwin-arm64.tar.gz"
      sha256 "7afadc2aa925023513573089ad8b8886ba0547a406e4aa2eba1a0bf2de551fa1"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.7.0/mesh-darwin-amd64.tar.gz"
      sha256 "089f92c954678b50d357c0bacf8c13c60e8d12b9231d0bf33adcbeaac65fdf1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.7.0/mesh-linux-arm64.tar.gz"
      sha256 "d46de48f72c47e5261200eb73067c8c8da3db5a2219263a2da9e5bf47e973d77"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.7.0/mesh-linux-amd64.tar.gz"
      sha256 "ecd5947b5a88921eac70023c0424447d4594d9afb39479d2f0bc1737161fd782"
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
