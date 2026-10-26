class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.13.0/mesh-darwin-arm64.tar.gz"
      sha256 "f7f36e3f373cadbbde049881a0c5957af76a07c84c9efe6efcafa0ba5fd7e2b7"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.13.0/mesh-darwin-amd64.tar.gz"
      sha256 "6e83053ffa7ffd92bee89b2952fcf18a424813f7d49aaa56a563134178957974"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.13.0/mesh-linux-arm64.tar.gz"
      sha256 "7189a22dead399cbfb53d3511a14e0f09a652b3ac4a6842e3cc300091925b041"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.13.0/mesh-linux-amd64.tar.gz"
      sha256 "80489b40391fda03a77cdf7a0a49d962da218592ed7a7593060305b92d19e6d9"
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
