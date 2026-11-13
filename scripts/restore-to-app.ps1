# Research-use only (PowerShell edition): copy the 9 archived files back into a
# LOCAL app checkout to reproduce the pre-8fd01ca complete examples.
# DEFAULT IS DRY-RUN (print only). Never runs `git add` / `git commit`.
# Usage: .\scripts\restore-to-app.ps1 <app-repo-dir> [-Apply]
param(
    [Parameter(Mandatory=$true)][string]$AppRepoDir,
    [switch]$Apply
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$dataRoot = Join-Path $AppRepoDir 'src/main/resources/data'
if (-not (Test-Path -LiteralPath $dataRoot -PathType Container)) {
    Write-Error "FAIL: $AppRepoDir does not look like the PhytoScope working tree"
    exit 1
}

# Gate: verify the archive before copying anything out of it.
& "$PSScriptRoot\verify.ps1" -Quiet | Out-Null
if ($LASTEXITCODE -ne 0) { Write-Error 'local verify failed; refusing to restore'; exit 1 }

if (-not $Apply) { Write-Host 'DRY-RUN: no files will be written. Re-run with -Apply to copy.' }

$sums = Join-Path $root 'SHA256SUMS.txt'
$count = 0
foreach ($line in Get-Content -LiteralPath $sums) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    if ($line -notmatch '^([0-9a-f]{64})  (.+)$') { continue }
    $relPath = $Matches[2]
    $rel = $relPath.Substring(5)   # strip 'data/'
    $source = Join-Path $root $relPath
    $target = Join-Path $dataRoot $rel
    $count++
    if ($Apply) {
        $parent = Split-Path -Parent $target
        if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
        Copy-Item -LiteralPath $source -Destination $target -Force
        Write-Host "COPIED  $rel -> $target"
    } else {
        Write-Host "WOULD COPY  $rel -> $target"
    }
}

Write-Host "Processed $count/9 files."
if ($Apply) {
    Write-Host 'NOTE: 这些文件不属于软件仓库当前版本；本脚本未执行 git add / git commit。'
    Write-Host 'NOTE: 复现完毕后请自行决定是否移除，避免把它们误提交回软件仓库。'
}
