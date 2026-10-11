class Vaultbreak < Formula
  desc "CLI for VaultBreak — secrets, handoffs, and MCP for agents"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.1.1/vaultbreak-darwin-arm64.tar.gz"
      sha256 "5d725f619f92021ef49500444a90a00a9b15a8ce82b5ed59b50aed9428081dd0"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.1.1/vaultbreak-darwin-amd64.tar.gz"
      sha256 "653c75deb914d0bac56b6f45f5c9a4f79cc8763c9d4ca4bb4b25cfe009cfac01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.1.1/vaultbreak-linux-arm64.tar.gz"
      sha256 "10916ee821da2e994c9aee94e2e3b3b69659732ac2bd82b140aa88f4b652482d"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.1.1/vaultbreak-linux-amd64.tar.gz"
      sha256 "fa9f81864f473a85eb9f58dbda33928d6e2d68f1ded247fc5046f6367aa2c0dc"
    end
  end

  def install
    bin.install "vaultbreak"
  end

  test do
    assert_match "vaultbreak", shell_output("#{bin}/vaultbreak --help")
  end
end
