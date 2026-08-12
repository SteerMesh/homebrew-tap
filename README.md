# SteerMesh

AI-native service mesh for distributed agent orchestration.

## Install

### Homebrew (recommended)

```bash
brew tap SteerMesh/steermesh
brew install mesh
```

To also install the networking layer:

```bash
brew install meshnet
```

### One-liner

```bash
curl -fsSL https://raw.githubusercontent.com/SteerMesh/steermesh/main/install.sh | bash
```

## Components

| Binary    | Description                                      |
|-----------|--------------------------------------------------|
| `mesh`    | CLI for agent orchestration and meshpad sessions |
| `meshnet` | Networking layer for distributed mesh topology   |

## Documentation

- [CLI Reference](docs/CLI_REFERENCE.md)
- [Meshpad Guide](docs/MESHPAD_GUIDE.md)
- [MeshNet Specification](docs/MESHNET_SPEC.md)

## Meshpad

The `meshpad/` directory contains ready-to-use agent configurations:

- `meshpad.toml` — default pad configuration
- `agents/` — pre-built agent personas (architect, coder, reviewer, etc.)
- `skills/` — reusable skill definitions

Copy to your project or use `mesh pad init` to scaffold.

## License

MIT
