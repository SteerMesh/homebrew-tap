# SteerMesh

> AI Agent Tooling Platform — define once, compile everywhere, share compute.

## Install

### Homebrew

```bash
brew tap SteerMesh/tap
brew trust steermesh/tap
```

**Linux:**

```bash
brew install mesh meshnet
```

**macOS** (requires `--formula` to avoid conflict with an unrelated cask):

```bash
brew install steermesh/tap/mesh steermesh/tap/meshnet
```

### One-liner (Linux/macOS, no Homebrew needed)

```bash
curl -fsSL https://raw.githubusercontent.com/SteerMesh/homebrew-tap/main/install.sh | bash
```

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/SteerMesh/homebrew-tap/main/install.ps1 | iex
```

## Post-install

```bash
# Install agent configs
mesh pad add https://github.com/SteerMesh/meshpad.git

# Initialize P2P node
meshnet init --name $(hostname)
meshnet serve
```

## What's included

| Binary    | Purpose                                                  |
|-----------|----------------------------------------------------------|
| `mesh`    | AI steering rules compiler + agentic runtime + TUI       |
| `meshnet` | P2P AI compute network — earn FLUX by sharing backends   |

## Upgrade

**Linux:** `brew upgrade mesh meshnet`

**macOS:** `brew upgrade steermesh/tap/mesh steermesh/tap/meshnet`

## Documentation

- [CLI Reference](docs/CLI_REFERENCE.md)
- [Meshpad Guide](docs/MESHPAD_GUIDE.md)
- [MeshNet Spec](docs/MESHNET_SPEC.md)

## License

MIT
