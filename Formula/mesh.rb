class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.10.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.2/mesh-darwin-arm64.tar.gz"
      sha256 "30564d412b8d8e2b1bb64f8ffdb72248695aeb90ff6e7fa8c461fde93b155750"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.2/mesh-darwin-amd64.tar.gz"
      sha256 "2225e2b5feb629fe14b9e87eedee7e3007b55b0e37859e4ddb76abd5b16a7532"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.2/mesh-linux-arm64.tar.gz"
      sha256 "5387f0fdd054a66ed97da7241a42b7e67015db6a76c8caa56ba24353023d6e3c"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.10.2/mesh-linux-amd64.tar.gz"
      sha256 "c79c1dffb7d133676343f97abdc72fe817ad47f407eabf6d1e67ae55e6b27407"
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
