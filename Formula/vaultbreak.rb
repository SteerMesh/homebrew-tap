class Vaultbreak < Formula
  desc "CLI for VaultBreak — secrets, handoffs, and MCP for agents"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.1.0/vaultbreak-darwin-arm64.tar.gz"
      sha256 "de5acab186dc07ad947e42e2644d3739a8fca268ef417cecc5094545115bc65b"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.1.0/vaultbreak-darwin-amd64.tar.gz"
      sha256 "2f91909806dc07489afd0616d94043eca445b8dec31fa62605ccc4d419a86f31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.1.0/vaultbreak-linux-arm64.tar.gz"
      sha256 "fcbdd87c3d166b15907bcd5c3a9352d6604aaf5443541a919f41aedda5ccda87"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/vaultbreak-v0.1.0/vaultbreak-linux-amd64.tar.gz"
      sha256 "a66c69055c15ae3b6f29ae1323e0eb88e6c67406b1b00904b7c33086d28c3591"
    end
  end

  def install
    bin.install "vaultbreak"
  end

  test do
    assert_match "vaultbreak", shell_output("#{bin}/vaultbreak --help")
  end
end
