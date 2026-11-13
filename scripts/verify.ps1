# Verify every file in data/ against SHA256SUMS.txt (PowerShell / Get-FileHash).
# Usage: .\scripts\verify.ps1 [-Quiet]
# Dependencies: PowerShell 5.1+ Get-FileHash. No network, no platform API.
param([switch]$Quiet)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root
$sums = Join-Path $root 'SHA256SUMS.txt'
if (-not (Test-Path -LiteralPath $sums)) {
    Write-Error 'FAIL: SHA256SUMS.txt is missing'
    exit 1
}

$fail = $false
$count = 0
foreach ($line in Get-Content -LiteralPath $sums) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    # Strict format: <64 hex><two spaces><data/relative path>
    if ($line -notmatch '^([0-9a-f]{64})  (.+)$') {
        Write-Host "FAIL malformed line: $line"
        $fail = $true
        continue
    }
    $expected = $Matches[1].ToLowerInvariant()
    $relPath = $Matches[2]
    $count++
    $full = Join-Path $root $relPath
    if (-not (Test-Path -LiteralPath $full -PathType Leaf)) {
        Write-Host "FAIL $relPath (file missing)"
        $fail = $true
        continue
    }
    $actual = (Get-FileHash -LiteralPath $full -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($expected -eq $actual) {
        if (-not $Quiet) { Write-Host "OK   $relPath" }
    } else {
        Write-Host "FAIL $relPath (expected $expected, got $actual)"
        $fail = $true
    }
}

if ($count -ne 9) {
    Write-Host "FAIL: expected 9 checksum lines, found $count"
    $fail = $true
}
if ($fail) {
    Write-Host "VERIFY FAILED ($count files checked)"
    exit 1
}
Write-Host 'VERIFY OK: 9/9 files match SHA256SUMS.txt'
