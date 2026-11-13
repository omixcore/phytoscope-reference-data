# INDEPENDENT BASELINE CHECK (PowerShell edition) - hard gate before `git rm`.
# Reads ORIGINAL BYTES from the git history blob via `git cat-file blob`, written
# to a temp file with cmd-style redirection so PowerShell never treats the binary
# stream as text (which would corrupt it). No provenance JSON is trusted here.
# Usage: .\scripts\verify-against-baseline.ps1 <app-repo-dir> <baseline-commit>
param(
    [Parameter(Mandatory=$true)][string]$AppRepoDir,
    [Parameter(Mandatory=$true)][string]$BaselineCommit
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

# First confirm the local data/ directory is intact.
& "$PSScriptRoot\verify.ps1" -Quiet | Out-Null
if ($LASTEXITCODE -ne 0) { Write-Error 'local verify failed'; exit 1 }

$sums = Join-Path $root 'SHA256SUMS.txt'
$git = 'git'
$tempDir = Join-Path $env:TEMP ("phytoscope-baseline-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tempDir | Out-Null
$fail = $false
$count = 0
$total = [long]0

try {
    foreach ($line in Get-Content -LiteralPath $sums) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        if ($line -notmatch '^([0-9a-f]{64})  (.+)$') {
            Write-Host "FAIL malformed line: $line"; $fail = $true; continue
        }
        $expected = $Matches[1].ToLowerInvariant()
        $relPath = $Matches[2]
        $rel = $relPath.Substring(5)   # strip 'data/'
        $appPath = "src/main/resources/data/$rel"
        $count++

        $localSum = (Get-FileHash -LiteralPath (Join-Path $root $relPath) -Algorithm SHA256).Hash.ToLowerInvariant()
        $total += (Get-Item -LiteralPath (Join-Path $root $relPath)).Length

        # Resolve the blob id, then stream its raw bytes to a temp file using
        # cmd redirection (byte-safe, unlike a PowerShell pipeline).
        $blobSpec = "${BaselineCommit}:$appPath"
        $blobId = & $git -C $AppRepoDir rev-parse $blobSpec 2>$null
        if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($blobId)) {
            Write-Host "FAIL $rel (baseline blob not found: $blobSpec)"; $fail = $true; continue
        }
        $blobId = $blobId.Trim()
        $tmp = Join-Path $tempDir ("$count.bin")
        cmd /c "`"$git`" -C `"$AppRepoDir`" cat-file blob $blobId > `"$tmp`""
        if ($LASTEXITCODE -ne 0) {
            Write-Host "FAIL $rel (git cat-file failed)"; $fail = $true; continue
        }
        $baselineSum = (Get-FileHash -LiteralPath $tmp -Algorithm SHA256).Hash.ToLowerInvariant()
        $baselineBytes = (Get-Item -LiteralPath $tmp).Length

        if ($expected -ne $localSum) {
            Write-Host "FAIL $rel (SHA256SUMS.txt $expected != local $localSum)"; $fail = $true
        } elseif ($localSum -ne $baselineSum) {
            Write-Host "FAIL $rel (local $localSum != baseline blob $baselineSum)"; $fail = $true
        } else {
            Write-Host "OK   $rel  sha256=$localSum  bytes=$baselineBytes"
        }
    }
} finally {
    Remove-Item -LiteralPath $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}

if ($count -ne 9) { Write-Host "FAIL: expected 9 files, checked $count"; $fail = $true }
if ($total -ne 68518847) { Write-Host "FAIL: byte total $total != 68518847"; $fail = $true }
if ($fail) {
    Write-Host 'BASELINE VERIFY FAILED - DO NOT RUN git rm'
    exit 1
}
Write-Host "BASELINE VERIFY OK: 9/9 files byte-identical to $BaselineCommit (total 68518847 bytes)"
