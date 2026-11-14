class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.17.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.3/mesh-darwin-arm64.tar.gz"
      sha256 "cfaaec9be56a0a6a12f5f5e93f092924b6a34f69b823d8050e70ba48f7eb7fa6"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.3/mesh-darwin-amd64.tar.gz"
      sha256 "9ec3137f05de1ea223709181ba66e6bcdd285558fbe3046c9ee3bd2fb0271441"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.3/mesh-linux-arm64.tar.gz"
      sha256 "b703b8de5576f9f61767ced3f8ebe28c70142b30ddf9247637ed895e3c428977"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.17.3/mesh-linux-amd64.tar.gz"
      sha256 "5f9477c18b521d026d50ef3a1f035f9b88036770e051a906e7222c61b318af62"
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
