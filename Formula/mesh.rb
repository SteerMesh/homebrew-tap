class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.15.0/mesh-darwin-arm64.tar.gz"
      sha256 "803bafbcf11fa3ad8ca5e5bf3c56f5a4561035a39975f5faa8f9286c1fc1b02c"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.15.0/mesh-darwin-amd64.tar.gz"
      sha256 "3b13dc5496f90ea4f75612cf034c1117ac80dd4f7dafc8857786c093bcc20dac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.15.0/mesh-linux-arm64.tar.gz"
      sha256 "246a5d3d5842efb687f526552231872b7a001b7fbe82dabf5433248b4d09a405"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.15.0/mesh-linux-amd64.tar.gz"
      sha256 "91d4edfb19453990c7909f9be130768d348c4cabb4928ac0b19d34465af228e7"
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
