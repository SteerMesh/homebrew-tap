class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.14.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.5/mesh-darwin-arm64.tar.gz"
      sha256 "c5148b3da6193610989acf35f2b0c7312462edf340590e5c893a48583bf542c7"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.5/mesh-darwin-amd64.tar.gz"
      sha256 "47396e8ba756ebc5faded2d9638648c15bc337c51992e3f01eeb0c925f600f41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.5/mesh-linux-arm64.tar.gz"
      sha256 "c732fe8030fde327f696160b70da74ec78d2e38eb5f2a5b9331f4940768eb9a8"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.14.5/mesh-linux-amd64.tar.gz"
      sha256 "2a8b108861a455351583ddc1f987c44d68c08eedff0c0c7789cbe4dd5d719e6a"
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
