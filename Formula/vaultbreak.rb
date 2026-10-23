class Vaultbreak < Formula
  desc "CLI for VaultBreak — secrets, handoffs, and MCP for agents"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.2.0/vaultbreak-darwin-arm64.tar.gz"
      sha256 "49cef9843f577300e4a6d4e0ce421cd948555f5001575d060721a3cdb492c8e1"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.2.0/vaultbreak-darwin-amd64.tar.gz"
      sha256 "2e3ab379cfb09f43fc4a058627fd7d8f41a0d1e9c4db8a124af0c92dea0ebe3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.2.0/vaultbreak-linux-arm64.tar.gz"
      sha256 "102875be1fff729a6b22e89ff7b7094e123ef79768f5a77beb103f0e61ee7cd2"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.2.0/vaultbreak-linux-amd64.tar.gz"
      sha256 "47b534ed872e9f37581ecdba819cbf0d8613e8e5392c8db89996be31a2fe1b71"
    end
  end

  def install
    bin.install "vaultbreak"
  end

  test do
    assert_match "vaultbreak", shell_output("#{bin}/vaultbreak --help")
  end
end
