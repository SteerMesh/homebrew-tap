class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.12.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.3/mesh-darwin-arm64.tar.gz"
      sha256 "48adf48cfb30874c3c1dc0657a3c0517b6a4569d528522b8acfec52ebf52c011"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.3/mesh-darwin-amd64.tar.gz"
      sha256 "6835abc9b3b7c3931dbdc635768633bf50929e8e9c2fa5f603fec31c6de84eb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.3/mesh-linux-arm64.tar.gz"
      sha256 "a2b8f74bd8a9259a6efc7f017394223690eafb068c586507687cef0793fdd1c3"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.3/mesh-linux-amd64.tar.gz"
      sha256 "66104ed576153bcc7c54e4429e836b79595974216ce6bded5794fb07856f1528"
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
