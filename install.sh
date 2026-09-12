#!/bin/bash
set -e

# SteerMesh installer — installs mesh + meshnet binaries
# Usage: curl -fsSL https://raw.githubusercontent.com/SteerMesh/homebrew-tap/main/install.sh | bash

BASE_URL="https://github.com/SteerMesh/homebrew-tap/releases/download"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"

# Resolve the latest published version for a release-tag prefix (e.g. "mesh"
# or "meshnet") from this repo's own Releases API, so we never hardcode a
# version that goes stale. Releases here are tagged "<prefix>-vX.Y.Z" and the
# API returns them newest-first.
resolve_latest() {
  # $1 = tag prefix, e.g. "mesh" or "meshnet"
  curl -fsSL "https://api.github.com/repos/SteerMesh/homebrew-tap/releases" 2>/dev/null \
    | grep '"tag_name"' \
    | grep "\"${1}-v" \
    | head -1 \
    | sed -E 's/.*"tag_name": *"'"${1}"'-(v[^"]*)".*/\1/'
}

MESH_VERSION="$(resolve_latest mesh || true)"
MESHNET_VERSION="$(resolve_latest meshnet || true)"

if [ -z "$MESH_VERSION" ]; then
  echo "Could not resolve latest mesh release from homebrew-tap. Check: https://github.com/SteerMesh/homebrew-tap/releases"
  exit 1
fi

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

# Install mesh
echo "Installing mesh ${MESH_VERSION}..."
MESH_URL="${BASE_URL}/mesh-${MESH_VERSION}/mesh-${OS}-${ARCH}.tar.gz"
if curl -fsSL "$MESH_URL" | tar xz -C "$INSTALL_DIR"; then
  chmod +x "${INSTALL_DIR}/mesh"
  echo "  ✓ mesh ${MESH_VERSION} installed"
else
  echo "  ✗ Failed to download mesh from ${MESH_URL}"
  echo "    Check: https://github.com/SteerMesh/homebrew-tap/releases"
fi

# Install meshnet
if [ -z "$MESHNET_VERSION" ]; then
  echo "  ⚠ Could not resolve latest meshnet release; skipping meshnet install."
  echo "    Check: https://github.com/SteerMesh/homebrew-tap/releases"
else
  echo "Installing meshnet ${MESHNET_VERSION}..."
  MESHNET_URL="${BASE_URL}/meshnet-${MESHNET_VERSION}/meshnet-${OS}-${ARCH}.tar.gz"
  if curl -fsSL "$MESHNET_URL" | tar xz -C "$INSTALL_DIR"; then
    chmod +x "${INSTALL_DIR}/meshnet"
    echo "  ✓ meshnet ${MESHNET_VERSION} installed"
  else
    echo "  ✗ Failed to download meshnet from ${MESHNET_URL}"
    echo "    Check: https://github.com/SteerMesh/homebrew-tap/releases"
  fi
fi

# PATH check
echo ""
if echo "$PATH" | grep -q "$INSTALL_DIR"; then
  echo "✓ ${INSTALL_DIR} is in your PATH"
else
  echo "⚠ Add ${INSTALL_DIR} to your PATH:"
  echo "  echo 'export PATH=\"${INSTALL_DIR}:\$PATH\"' >> ~/.bashrc"
  echo "  source ~/.bashrc"
fi

echo ""
echo "Next steps:"
echo "  mesh pad add https://github.com/SteerMesh/meshpad.git"
echo "  meshnet init --name $(hostname)"
echo "  mesh chat --agent orchestrator"
