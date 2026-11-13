#!/usr/bin/env bash
# INDEPENDENT BASELINE CHECK - the hard gate before `git rm` in the app repository.
# Reads the ORIGINAL BYTES from the git history blob (git show <commit>:<path>),
# NOT from the working tree and NOT from any provenance JSON.
# Usage: ./scripts/verify-against-baseline.sh <app-repo-dir> <baseline-commit>
# Example: ./scripts/verify-against-baseline.sh "G:/.../phytoscope" 8fd01ca
set -euo pipefail
DR="$(cd "$(dirname "$0")/.." && pwd)"
APP="${1:-}"
BASE="${2:-}"
if [ -z "$APP" ] || [ -z "$BASE" ]; then
    echo "Usage: $0 <app-repo-dir> <baseline-commit>" >&2
    exit 2
fi
if [ ! -d "$APP/.git" ] && [ ! -f "$APP/.git" ]; then
    echo "FAIL: $APP is not a git repository" >&2
    exit 1
fi

# First make sure the local data directory itself is intact.
"$DR/scripts/verify.sh" -q

fail=0
count=0
while read -r expected path; do
    [ -z "${expected:-}" ] && continue
    [ -z "${path:-}" ] && continue
    rel="${path#data/}"
    appPath="src/main/resources/data/$rel"
    count=$((count + 1))

    # 1) checksum recorded in this repository
    localSum=$(sha256sum "$DR/$path" | cut -d' ' -f1)
    # 2) checksum of the ORIGINAL blob at the baseline commit (independent truth)
    baselineSum=$(git -C "$APP" show "$BASE:$appPath" | sha256sum | cut -d' ' -f1)
    baselineBytes=$(git -C "$APP" cat-file -s "$BASE:$appPath")

    if [ "$expected" != "$localSum" ]; then
        echo "FAIL $rel (SHA256SUMS.txt $expected != local $localSum)"
        fail=1
    elif [ "$localSum" != "$baselineSum" ]; then
        echo "FAIL $rel (local $localSum != baseline blob $baselineSum)"
        fail=1
    else
        echo "OK   $rel  sha256=$localSum  bytes=$baselineBytes"
    fi
done < "$DR/SHA256SUMS.txt"

if [ "$count" -ne 9 ]; then
    echo "FAIL: expected 9 files, checked $count" >&2
    fail=1
fi
# Byte total must match the audited 68,518,847 B.
total=$(find "$DR/data" -type f -printf '%s\n' | awk '{s+=$1} END {print s+0}')
if [ "$total" -ne 68518847 ]; then
    echo "FAIL: byte total $total != 68518847" >&2
    fail=1
fi
if [ "$fail" -ne 0 ]; then
    echo "BASELINE VERIFY FAILED - DO NOT RUN git rm" >&2
    exit 1
fi
echo "BASELINE VERIFY OK: 9/9 files byte-identical to $BASE (total 68518847 bytes)"
