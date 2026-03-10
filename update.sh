#!/usr/bin/env bash
# update.sh -- pull the latest opencode config from origin/main
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Updating opencode config..."
git pull origin main
echo "Done."
