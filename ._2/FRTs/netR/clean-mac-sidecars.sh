#!/usr/bin/env bash
set -euo pipefail

# Remove AppleDouble sidecar files (._*) created by macOS on non-HFS/APFS filesystems.
# Usage:
#   scripts/clean-mac-sidecars.sh                # clean current folder recursively
#   scripts/clean-mac-sidecars.sh /path/to/dir   # clean a specific folder
#   scripts/clean-mac-sidecars.sh --dry-run      # show what would be deleted

TARGET="${1:-.}"
DRY_RUN=0

if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=1
  TARGET="${2:-.}"
fi

if [[ ! -d "$TARGET" ]]; then
  echo "Error: target directory not found: $TARGET" >&2
  exit 1
fi

echo "Scanning: $TARGET"
COUNT=$(find "$TARGET" -type f -name "._*" | wc -l | tr -d ' ')
echo "Found $COUNT AppleDouble file(s)."

if [[ "$COUNT" == "0" ]]; then
  exit 0
fi

if [[ "$DRY_RUN" == "1" ]]; then
  find "$TARGET" -type f -name "._*"
  exit 0
fi

find "$TARGET" -type f -name "._*" -delete
echo "Deleted $COUNT AppleDouble file(s)."
