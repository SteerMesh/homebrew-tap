class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.6.0/mesh-darwin-arm64.tar.gz"
      sha256 "a121f803f6dbecb7d839033a69963d7a8fb200d5dfb6da1cda6eb22186b2de1a"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.6.0/mesh-darwin-amd64.tar.gz"
      sha256 "9f061c087293b49ee6479ccfcf5d3696224f717ba0c8291f73b7e038b6fca206"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.6.0/mesh-linux-arm64.tar.gz"
      sha256 "7f4ca52c942695063e1a5bb32807be706bcee06592ce2101566e802fa2595c04"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.6.0/mesh-linux-amd64.tar.gz"
      sha256 "b33d7c44225d630c119a627bd98e6e46be77e89556c58af468461f2b3b7a41d5"
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
