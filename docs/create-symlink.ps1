# Create Symlink for Documentation

# This script creates a symbolic link from docs/sections to src
# so that VitePress can access the content without duplication

$sourcePath = Join-Path $PSScriptRoot "..\src"
$targetPath = Join-Path $PSScriptRoot "sections"

# Check if symlink already exists
if (Test-Path $targetPath) {
    Write-Host "Symlink already exists at: $targetPath" -ForegroundColor Yellow
    exit 0
}

# Create the symlink
try {
    New-Item -ItemType SymbolicLink -Path $targetPath -Target $sourcePath -Force
    Write-Host "✓ Successfully created symlink:" -ForegroundColor Green
    Write-Host "  From: $targetPath" -ForegroundColor Cyan
    Write-Host "  To: $sourcePath" -ForegroundColor Cyan
} catch {
    Write-Host "✗ Failed to create symlink. Please run PowerShell as Administrator." -ForegroundColor Red
    Write-Host "  Error: $_" -ForegroundColor Red
    exit 1
}
