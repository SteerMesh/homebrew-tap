class Meshnet < Formula
  desc "Networking layer for SteerMesh distributed agent topology"
  homepage "https://github.com/SteerMesh/homebrew-tap"
  version "0.3.0"
  license "MIT"

  # Last release under the meshnet name. New installs should use meshgrid.
  deprecate! date:                "2026-09-27",
             because:             "was renamed to Mesh Grid — install steermesh/tap/meshgrid instead",
             replacement_formula: "steermesh/tap/meshgrid"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.3.0/meshnet-darwin-arm64.tar.gz"
      sha256 "3b12b1d1eb459d43a490f45ddd80ab927716731aef7828588615d48cea7ac756"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.3.0/meshnet-darwin-amd64.tar.gz"
      sha256 "0143d20def6174db6b54a72b15cf52b1870b295455c467bad9f942700d253781"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.3.0/meshnet-linux-arm64.tar.gz"
      sha256 "6323c9de8b437d48e5cd83312c7ecd638c945928e960629e80bef165c47a3207"
    else
      url "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.3.0/meshnet-linux-amd64.tar.gz"
      sha256 "899f3122413f8d1e94f3bf4b994860741c9b20dc6b16c31932cab2e1406660ba"
    end
  end

  def install
    bin.install "meshnet"
  end

  def caveats
    <<~EOS
      meshnet has been renamed to meshgrid (Mesh Grid).
      Existing installs keep working; new installs should use:
        brew install steermesh/tap/meshgrid
    EOS
  end

  test do
    # v0.3.0 has a `version` subcommand but no `--version` flag
    # (that flag only landed on the renamed meshgrid binary).
    assert_match "meshnet v0.3.0", shell_output("#{bin}/meshnet version")
  end
end
