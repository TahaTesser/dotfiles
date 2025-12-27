#!/bin/bash

echo "Setting up GitHub CLI configuration..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Check if gh is installed
if ! command -v gh >/dev/null 2>&1; then
    echo "GitHub CLI is not installed. Please install it first:"
    echo "  brew install gh"
    exit 1
fi

# Check if logged in
if ! gh auth status >/dev/null 2>&1; then
    echo "Not logged in to GitHub CLI. Please run:"
    echo "  gh auth login"
    exit 1
fi

# Set up gh configuration
GH_CONFIG_DIR="$HOME/.config/gh"
mkdir -p "$GH_CONFIG_DIR/scripts"

# Copy config files
echo "Copying gh config files..."
cp "$DOTFILES_DIR/.config/gh/config.yml" "$GH_CONFIG_DIR/config.yml"

# Copy scripts
echo "Copying alias scripts..."
cp "$DOTFILES_DIR/.config/gh/scripts/"*.sh "$GH_CONFIG_DIR/scripts/"
chmod +x "$GH_CONFIG_DIR/scripts/"*.sh

echo "GitHub CLI setup complete!"
echo ""
echo "Available aliases:"
gh alias list
