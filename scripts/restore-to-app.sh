#!/usr/bin/env bash
# Research-use only: copy the 9 archived files back into a LOCAL app checkout to
# reproduce the pre-8fd01ca complete examples. DEFAULT IS DRY-RUN (print only).
# Never runs `git add` / `git commit`; does not modify any application logic.
# Usage: ./scripts/restore-to-app.sh <app-repo-dir> [--apply]
#   (no flag / --dry-run) -> dry-run, print actions only
#   --apply                -> actually copy files
set -euo pipefail
DR="$(cd "$(dirname "$0")/.." && pwd)"
APP="${1:-}"
MODE="${2:---dry-run}"
if [ -z "$APP" ]; then
    echo "Usage: $0 <app-repo-dir> [--apply]" >&2
    exit 2
fi
if [ "$MODE" != "--apply" ] && [ "$MODE" != "--dry-run" ]; then
    echo "Unknown option: $MODE (expected --apply or --dry-run)" >&2
    exit 2
fi
if [ ! -d "$APP/src/main/resources/data" ]; then
    echo "FAIL: $APP does not look like the PhytoScope working tree" >&2
    exit 1
fi

# Gate: verify the archive before copying anything out of it.
"$DR/scripts/verify.sh" -q

if [ "$MODE" = "--dry-run" ]; then
    echo "DRY-RUN: no files will be written. Re-run with --apply to copy."
fi

count=0
while read -r expected path; do
    [ -z "${expected:-}" ] && continue
    [ -z "${path:-}" ] && continue
    rel="${path#data/}"
    target="$APP/src/main/resources/data/$rel"
    count=$((count + 1))
    if [ "$MODE" = "--apply" ]; then
        mkdir -p "$(dirname "$target")"
        cp "$DR/$path" "$target"
        echo "COPIED  $rel -> $target"
    else
        echo "WOULD COPY  $rel -> $target"
    fi
done < "$DR/SHA256SUMS.txt"

echo "Processed $count/9 files."
if [ "$MODE" = "--apply" ]; then
    echo "NOTE: 这些文件不属于软件仓库当前版本；本脚本未执行 git add / git commit。"
    echo "NOTE: 复现完毕后请自行决定是否移除，避免把它们误提交回软件仓库。"
fi
