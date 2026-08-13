# SteerMesh installer for Windows
# Usage: irm https://raw.githubusercontent.com/SteerMesh/homebrew-tap/main/install.ps1 | iex

$ErrorActionPreference = 'Stop'

$VERSION_MESH = 'v0.3.1'
$VERSION_MESHNET = 'v0.2.0'
$INSTALL_DIR = "$env:LOCALAPPDATA\SteerMesh\bin"

Write-Host 'SteerMesh Installer (Windows)' -ForegroundColor Cyan
Write-Host "  Install dir: $INSTALL_DIR"
Write-Host ''

# Create install directory
if (!(Test-Path $INSTALL_DIR)) {
    New-Item -ItemType Directory -Path $INSTALL_DIR -Force | Out-Null
}

# Download mesh
Write-Host 'Installing mesh...' -ForegroundColor Green
$meshUrl = "https://github.com/SteerMesh/homebrew-tap/releases/download/mesh-$VERSION_MESH/mesh-windows-amd64.tar.gz"
$meshTar = "$env:TEMP\mesh-windows-amd64.tar.gz"
Invoke-WebRequest -Uri $meshUrl -OutFile $meshTar -UseBasicParsing
tar xzf $meshTar -C $INSTALL_DIR
Remove-Item $meshTar -Force
Write-Host "  OK mesh $VERSION_MESH" -ForegroundColor Green

# Download meshnet
Write-Host 'Installing meshnet...' -ForegroundColor Green
$meshnetUrl = "https://github.com/SteerMesh/homebrew-tap/releases/download/meshnet-$VERSION_MESHNET/meshnet-windows-amd64.tar.gz"
$meshnetTar = "$env:TEMP\meshnet-windows-amd64.tar.gz"
Invoke-WebRequest -Uri $meshnetUrl -OutFile $meshnetTar -UseBasicParsing
tar xzf $meshnetTar -C $INSTALL_DIR
Remove-Item $meshnetTar -Force
Write-Host "  OK meshnet $VERSION_MESHNET" -ForegroundColor Green

# Add to PATH if not already there
$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User')
if ($currentPath -notlike "*$INSTALL_DIR*") {
    [Environment]::SetEnvironmentVariable('Path', "$INSTALL_DIR;$currentPath", 'User')
    Write-Host ''
    Write-Host "  Added $INSTALL_DIR to your PATH" -ForegroundColor Yellow
    Write-Host '  Restart your terminal for PATH changes to take effect.' -ForegroundColor Yellow
} else {
    Write-Host ''
    Write-Host "  $INSTALL_DIR already in PATH" -ForegroundColor Green
}

Write-Host ''
Write-Host 'Done! Next steps:' -ForegroundColor Cyan
Write-Host '  mesh pad add https://github.com/SteerMesh/meshpad.git'
Write-Host '  meshnet init --name $env:COMPUTERNAME'
Write-Host '  mesh chat --agent orchestrator'
