class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.2/mesh-darwin-arm64.tar.gz"
      sha256 "aa5d338914137191958746109341070cadf9ae0b20601322e727546db4068cc6"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.2/mesh-darwin-amd64.tar.gz"
      sha256 "a80fe7410d1c970e070e9281b54415ae21ab7469b2eefa380d3d20bce17926b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.2/mesh-linux-arm64.tar.gz"
      sha256 "5cb70167fde02211870ba742a03c4f6b13d8176a45267ff686aa889a57b499d1"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.2/mesh-linux-amd64.tar.gz"
      sha256 "5588dc160a35d99f25dd2b867e4173073ac97113546ef8f7b6ed87e7a4211ad9"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
