#!/bin/bash
# Sync aliases from aliases.yml to GitHub CLI config
# Usage: ./sync-aliases.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_FILE="${SCRIPT_DIR}/aliases.yml"
CONFIG_FILE="${SCRIPT_DIR}/config.yml"

if [ ! -f "$ALIASES_FILE" ]; then
  echo "❌ Error: aliases.yml not found at $ALIASES_FILE"
  exit 1
fi

echo "🔄 Syncing aliases from aliases.yml to GitHub CLI..."
gh alias import "$ALIASES_FILE"

echo "✅ Aliases synced successfully!"
echo ""
echo "📋 Current aliases:"
gh alias list

