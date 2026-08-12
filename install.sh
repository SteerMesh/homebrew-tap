#!/bin/bash
set -e

# SteerMesh installer — installs mesh + meshnet binaries
# Usage: curl -fsSL https://steermesh.dev/install | bash

VERSION="${STEERMESH_VERSION:-latest}"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"

# Detect platform
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
case "$ARCH" in
  x86_64) ARCH="amd64" ;;
  aarch64|arm64) ARCH="arm64" ;;
  *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

echo "SteerMesh Installer"
echo "  Platform: ${OS}/${ARCH}"
echo "  Install dir: ${INSTALL_DIR}"
echo ""

mkdir -p "$INSTALL_DIR"

# ── mesh ───────────────────────────────────────────────────────────────────────

MESH_REPO="SteerMesh/mesh"
echo "Installing mesh..."

if [ "$VERSION" = "latest" ]; then
  MESH_URL="https://github.com/${MESH_REPO}/releases/latest/download/mesh-${OS}-${ARCH}"
else
  MESH_URL="https://github.com/${MESH_REPO}/releases/download/${VERSION}/mesh-${OS}-${ARCH}"
fi

if curl -fsSL "$MESH_URL" -o "${INSTALL_DIR}/mesh" 2>/dev/null; then
  chmod +x "${INSTALL_DIR}/mesh"
  echo "  ✓ mesh installed ($(${INSTALL_DIR}/mesh version 2>/dev/null || echo 'unknown'))"
else
  echo "  ⚠ mesh binary not found at ${MESH_URL}"
  echo "    Trying go install..."
  if command -v go &>/dev/null; then
    go install "github.com/${MESH_REPO}/cmd/mesh@latest" 2>/dev/null && echo "  ✓ mesh installed via go install" || echo "  ✗ go install failed"
  else
    echo "  ✗ Go not installed. Install mesh manually: https://github.com/${MESH_REPO}"
  fi
fi

# ── meshnet ────────────────────────────────────────────────────────────────────

MESHNET_REPO="SteerMesh/meshnet"
echo "Installing meshnet..."

if [ "$VERSION" = "latest" ]; then
  MESHNET_URL="https://github.com/${MESHNET_REPO}/releases/latest/download/meshnet-${OS}-${ARCH}"
else
  MESHNET_URL="https://github.com/${MESHNET_REPO}/releases/download/${VERSION}/meshnet-${OS}-${ARCH}"
fi

if curl -fsSL "$MESHNET_URL" -o "${INSTALL_DIR}/meshnet" 2>/dev/null; then
  chmod +x "${INSTALL_DIR}/meshnet"
  echo "  ✓ meshnet installed ($(${INSTALL_DIR}/meshnet version 2>/dev/null || echo 'unknown'))"
else
  echo "  ⚠ meshnet binary not found at ${MESHNET_URL}"
  echo "    Trying go install..."
  if command -v go &>/dev/null; then
    go install "github.com/${MESHNET_REPO}/cmd/meshnet@latest" 2>/dev/null && echo "  ✓ meshnet installed via go install" || echo "  ✗ go install failed"
  else
    echo "  ✗ Go not installed. Install meshnet manually: https://github.com/${MESHNET_REPO}"
  fi
fi

# ── PATH check ─────────────────────────────────────────────────────────────────

echo ""
if echo "$PATH" | grep -q "$INSTALL_DIR"; then
  echo "✓ ${INSTALL_DIR} is in your PATH"
else
  echo "⚠ Add ${INSTALL_DIR} to your PATH:"
  echo "  echo 'export PATH=\"${INSTALL_DIR}:\$PATH\"' >> ~/.zshrc"
  echo "  source ~/.zshrc"
fi

# ── meshpad ────────────────────────────────────────────────────────────────────

echo ""
echo "Optional: Install the default meshpad (agent configs):"
echo "  mesh pad add https://github.com/SteerMesh/meshpad"
echo ""
echo "Optional: Initialize meshnet node:"
echo "  meshnet init --name $(hostname)"
echo ""
echo "Done! Run 'mesh --help' or 'meshnet --help' to get started."
