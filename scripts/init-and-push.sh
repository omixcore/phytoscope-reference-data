#!/usr/bin/env bash
# First commit + push this reference-data repository to TWO existing mirrors.
#
# 重要（交付边界）：远端仓库需用户事先在网页创建或提供 token。
# 本脚本只接收两个「已存在的空仓库 URL」作为位置参数；它绝不调用任何平台 API、
# 不尝试创建远端仓库、不读取任何远程清单、不做按需下载。
#
# Usage: ./scripts/init-and-push.sh <gitee-url> <github-url>
# Example:
#   ./scripts/init-and-push.sh https://gitee.com/omixcore/phytoscope-reference-data.git \
#                              git@github-w1996jy:omixcore/phytoscope-reference-data.git
#
# 两平台仓库同名 phytoscope-reference-data，互为镜像，推送同一提交 HEAD:main。
set -euo pipefail
DR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$DR"

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <gitee-url> <github-url>" >&2
    echo "两个远端仓库必须是用户事先创建好的空仓库。" >&2
    exit 2
fi
GITEE_URL="$1"
GITHUB_URL="$2"

# Gate: never publish an unverified copy.
"$DR/scripts/verify.sh" -q

if [ ! -d "$DR/.git" ]; then
    git init -b main "$DR"
fi

# .gitattributes uses * -text, so no line-ending conversion can alter data/ bytes.
git add -A
if git diff --cached --quiet; then
    echo "Nothing staged; reusing the existing HEAD."
else
    git commit -m "data: archive complete PhytoScope reference data (baseline 8fd01ca)"
fi

# Idempotent remotes: replace any previous gitee/github entries.
if git remote get-url gitee >/dev/null 2>&1; then git remote set-url gitee "$GITEE_URL"; else git remote add gitee "$GITEE_URL"; fi
if git remote get-url github >/dev/null 2>&1; then git remote set-url github "$GITHUB_URL"; else git remote add github "$GITHUB_URL"; fi

git push gitee HEAD:main
git push github HEAD:main

echo "Pushed the SAME commit to gitee and github:"
git rev-parse HEAD
echo "请把两个地址回填到 MANIFEST.json / 主仓库 reference-provenance.json，并回填 migration_commit。"
