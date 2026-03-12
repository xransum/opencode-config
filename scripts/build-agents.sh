#!/usr/bin/env bash
# build-agents.sh -- regenerate AGENTS.md from rules/**/*.md
#
# Usage:
#   ./scripts/build-agents.sh           # writes to AGENTS.md in repo root
#   ./scripts/build-agents.sh --check   # exits non-zero if AGENTS.md is stale
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
RULES_DIR="$REPO_ROOT/rules"
OUT_FILE="$REPO_ROOT/AGENTS.md"

# Collect rule files in a stable order:
#   1. Sort directories alphabetically
#   2. Sort files within each directory alphabetically
mapfile -t RULE_FILES < <(
    find "$RULES_DIR" -name '*.md' -type f \
    | sort
)

if [[ ${#RULE_FILES[@]} -eq 0 ]]; then
    echo "ERROR: no .md files found under $RULES_DIR" >&2
    exit 1
fi

# Build output in a temp file first so --check can diff cleanly
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

{
    printf '# Global Rules\n'

    for f in "${RULE_FILES[@]}"; do
        printf '\n---\n\n'
        # Demote top-level headings: # -> ## and ## -> ### etc.
        # so each rule sits under the parent "# Global Rules" h1.
        sed 's/^#/##/' "$f"
        # Ensure the file ends with a newline before the next separator
        [[ "$(tail -c1 "$f" | wc -l)" -eq 0 ]] && printf '\n'
    done
} > "$TMP"

if [[ "${1:-}" == "--check" ]]; then
    if diff -q "$TMP" "$OUT_FILE" > /dev/null 2>&1; then
        echo "AGENTS.md is up to date."
    else
        echo "AGENTS.md is stale. Run ./scripts/build-agents.sh to regenerate." >&2
        diff "$TMP" "$OUT_FILE" >&2 || true
        exit 1
    fi
else
    cp "$TMP" "$OUT_FILE"
    echo "Wrote $OUT_FILE (${#RULE_FILES[@]} rule files)"
fi
