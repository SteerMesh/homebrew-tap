# SteerMesh

> AI Agent Tooling Platform — define once, compile everywhere, share compute.

## Install (macOS / Linux)

### Homebrew

```bash
brew tap SteerMesh/tap
brew trust steermesh/tap
brew install mesh meshnet
```

### One-liner (no Homebrew needed)

```bash
curl -fsSL https://raw.githubusercontent.com/SteerMesh/homebrew-tap/main/install.sh | bash
```

### Manual download

```bash
# macOS Apple Silicon (M1/M2/M3/M4)
curl -fsSL https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.1/mesh-darwin-arm64.tar.gz | tar xz -C /usr/local/bin/
curl -fsSL https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-darwin-arm64.tar.gz | tar xz -C /usr/local/bin/
chmod +x /usr/local/bin/mesh /usr/local/bin/meshnet

# macOS Intel
curl -fsSL https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.1/mesh-darwin-amd64.tar.gz | tar xz -C /usr/local/bin/
curl -fsSL https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-darwin-amd64.tar.gz | tar xz -C /usr/local/bin/
chmod +x /usr/local/bin/mesh /usr/local/bin/meshnet

# Linux x86_64
curl -fsSL https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.1/mesh-linux-amd64.tar.gz | tar xz -C ~/.local/bin/
curl -fsSL https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-linux-amd64.tar.gz | tar xz -C ~/.local/bin/
chmod +x ~/.local/bin/mesh ~/.local/bin/meshnet

# Linux ARM64
curl -fsSL https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-v0.3.1/mesh-linux-arm64.tar.gz | tar xz -C ~/.local/bin/
curl -fsSL https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-v0.2.0/meshnet-linux-arm64.tar.gz | tar xz -C ~/.local/bin/
chmod +x ~/.local/bin/mesh ~/.local/bin/meshnet
```

## Post-install

```bash
# Install agent configs (orchestrator, coder, reviewer, etc.)
mesh pad add https://github.com/SteerMesh/meshpad.git

# Initialize your P2P compute node
meshnet init --name $(hostname)

# Start sharing your backends on the network
meshnet serve
```

## What's included

| Binary    | Purpose                                                  |
|-----------|----------------------------------------------------------|
| `mesh`    | AI steering rules compiler + agentic runtime + TUI       |
| `meshnet` | P2P AI compute network — earn FLUX by sharing backends   |

## Upgrade

```bash
brew upgrade mesh meshnet
```

## Documentation

- [CLI Reference](docs/CLI_REFERENCE.md)
- [Meshpad Guide](docs/MESHPAD_GUIDE.md)
- [MeshNet Spec](docs/MESHNET_SPEC.md)

## License

MIT
