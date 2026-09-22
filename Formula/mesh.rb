class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.5/mesh-darwin-arm64.tar.gz"
      sha256 "2d0245b382309c0a31a2bfa241ba3551833517f909b46a74f00124cdd965fd22"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.5/mesh-darwin-amd64.tar.gz"
      sha256 "c525d4725dd2992aed36d1f8bf34ac3d9feca706ceee9fd77337754a47350e7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.5/mesh-linux-arm64.tar.gz"
      sha256 "8fb84745b6d8bb05075e3eedd0f9c175414aec1c253bfcd68e6f1b1e6f0f4af4"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.5.5/mesh-linux-amd64.tar.gz"
      sha256 "33516b1242f2a6d550a5a85b64b6b94d43c09e9bb1a166f72e9e0e2dda5c9069"
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
