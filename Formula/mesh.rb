class Mesh < Formula
  desc "SteerMesh CLI — AI steering rules compiler and agent orchestration"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.4/mesh-darwin-arm64.tar.gz"
      sha256 "bc7dc1b7eb0c4d66df536256eed32cc521e11ec11ed3a45c8dca37036cd39ac4"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.4/mesh-darwin-amd64.tar.gz"
      sha256 "01749a57c4a15b629ed1c76c6862b770ea573910c2446f015363f2ce7b854f50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.4/mesh-linux-arm64.tar.gz"
      sha256 "7b8d33ac9e6a38a39b956977471b698ddf8945a78ca6653ba5aeb48c4647c4fd"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.4/mesh-linux-amd64.tar.gz"
      sha256 "595914836f0c2ddb6c904e67321e1fd23d647c298a6c0d68e150b277df343abd"
    end
  end

  def install
    bin.install "mesh"
  end

  test do
    assert_match "mesh version", shell_output("#{bin}/mesh --version")
  end
end
