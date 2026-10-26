class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.2/mesh-darwin-arm64.tar.gz"
      sha256 "eb1da1c8a7400540cefbc11427e6ffe24d9c326c9151c14b86fe4bb144ff296a"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.2/mesh-darwin-amd64.tar.gz"
      sha256 "a1aa886466cc25ed7b9151ebdac3111d8947228f6a10efc5802fc4052f647a36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.2/mesh-linux-arm64.tar.gz"
      sha256 "b4f64af601e2f753ddbdd6733b59c9a9b9ebc1862eac9974bf24eaf692d19245"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.12.2/mesh-linux-amd64.tar.gz"
      sha256 "7b7c93967183d0b272b267614831c228b795e3065a26252f12381bf06d092661"
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
