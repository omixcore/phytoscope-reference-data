#!/usr/bin/env bash
# Verify every file in data/ against SHA256SUMS.txt (recomputed byte checksums).
# Usage: ./scripts/verify.sh [-q]      (-q = quiet, only print the summary)
# Dependencies: git-bash coreutils (sha256sum). No network, no platform API.
set -euo pipefail
cd "$(dirname "$0")/.."

QUIET=0
if [ "${1:-}" = "-q" ]; then QUIET=1; fi
if [ ! -f SHA256SUMS.txt ]; then
    echo "FAIL: SHA256SUMS.txt is missing" >&2
    exit 1
fi

fail=0
count=0
while read -r expected path; do
    [ -z "${expected:-}" ] && continue
    [ -z "${path:-}" ] && continue
    count=$((count + 1))
    if [ ! -f "$path" ]; then
        echo "FAIL $path (file missing)"
        fail=1
        continue
    fi
    actual=$(sha256sum "$path" | cut -d' ' -f1)
    if [ "$expected" = "$actual" ]; then
        if [ "$QUIET" -eq 0 ]; then echo "OK   $path"; fi
    else
        echo "FAIL $path (expected $expected, got $actual)"
        fail=1
    fi
done < SHA256SUMS.txt

if [ "$count" -ne 9 ]; then
    echo "FAIL: expected 9 checksum lines, found $count"
    fail=1
fi
if [ "$fail" -ne 0 ]; then
    echo "VERIFY FAILED ($count files checked)"
    exit 1
fi
echo "VERIFY OK: 9/9 files match SHA256SUMS.txt"
