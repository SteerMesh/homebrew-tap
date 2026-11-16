class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.17.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.6/mesh-darwin-arm64.tar.gz"
      sha256 "4a86b999bc290f511404850906b58791d91d59c52487b641152992ec9d132555"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.6/mesh-darwin-amd64.tar.gz"
      sha256 "83f1020a4a6d3cf935cffdf5438c08aafeda5fe4133d635dd378a71197992fe6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.6/mesh-linux-arm64.tar.gz"
      sha256 "fd13c4784c952e55940e61a314b854c51057a902323b4df45397c67792bdcf63"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.6/mesh-linux-amd64.tar.gz"
      sha256 "56a76cbd7102c2af15eb0faf91c33b61af572503fa5576f799fd001f38c2d17e"
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
