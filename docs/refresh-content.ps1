# Refresh Documentation Content
# Use this if you cannot use symlinks (Admin rights required for symlinks)
# This script copies the latest content from src to docs/sections

$sourcePath = Join-Path $PSScriptRoot "..\src"
$targetPath = Join-Path $PSScriptRoot "sections"

Write-Host "Refreshing content from src..." -ForegroundColor Cyan

try {
    Copy-Item -Path $sourcePath -Destination $targetPath -Recurse -Force
    Write-Host "✓ Successfully refreshed content in docs/sections" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to copy content" -ForegroundColor Red
    Write-Host "  Error: $_" -ForegroundColor Red
    exit 1
}
