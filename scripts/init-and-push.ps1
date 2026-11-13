# First commit + push this reference-data repository to TWO existing mirrors
# (PowerShell edition).
#
# 重要（交付边界）：远端仓库需用户事先在网页创建或提供 token。
# 本脚本只接收两个「已存在的空仓库 URL」作为位置参数；它绝不调用任何平台 API、
# 不尝试创建远端仓库、不读取任何远程清单、不做按需下载。
#
# Usage: .\scripts\init-and-push.ps1 <gitee-url> <github-url>
# 两平台仓库同名 phytoscope-reference-data，互为镜像，推送同一提交 HEAD:main。
param(
    [Parameter(Mandatory=$true)][string]$GiteeUrl,
    [Parameter(Mandatory=$true)][string]$GithubUrl
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

# Gate: never publish an unverified copy.
& "$PSScriptRoot\verify.ps1" -Quiet | Out-Null
if ($LASTEXITCODE -ne 0) { Write-Error 'local verify failed; refusing to push'; exit 1 }

$git = 'git'
if (-not (Test-Path -LiteralPath (Join-Path $root '.git'))) {
    & $git init -b main $root
    if ($LASTEXITCODE -ne 0) { Write-Error 'git init failed'; exit 1 }
}

# .gitattributes uses * -text, so no line-ending conversion can alter data/ bytes.
& $git add -A
if ($LASTEXITCODE -ne 0) { Write-Error 'git add failed'; exit 1 }
& $git diff --cached --quiet
if ($LASTEXITCODE -eq 1) {
    & $git commit -m 'data: archive complete PhytoScope reference data (baseline 8fd01ca)'
    if ($LASTEXITCODE -ne 0) { Write-Error 'git commit failed'; exit 1 }
} else {
    Write-Host 'Nothing staged; reusing the existing HEAD.'
}

# Idempotent remotes: replace any previous gitee/github entries.
& $git remote get-url gitee 2>$null | Out-Null
if ($LASTEXITCODE -eq 0) { & $git remote set-url gitee $GiteeUrl } else { & $git remote add gitee $GiteeUrl }
& $git remote get-url github 2>$null | Out-Null
if ($LASTEXITCODE -eq 0) { & $git remote set-url github $GithubUrl } else { & $git remote add github $GithubUrl }

& $git push gitee HEAD:main
if ($LASTEXITCODE -ne 0) { Write-Error 'push to gitee failed'; exit 1 }
& $git push github HEAD:main
if ($LASTEXITCODE -ne 0) { Write-Error 'push to github failed'; exit 1 }

Write-Host 'Pushed the SAME commit to gitee and github:'
& $git rev-parse HEAD
Write-Host '请把两个地址回填到 MANIFEST.json / 主仓库 reference-provenance.json，并回填 migration_commit。'
