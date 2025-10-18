#!/bin/bash

echo "Starting development environment setup..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run individual setup scripts
echo "Running zsh setup..."
"$SCRIPT_DIR/scripts/zsh.sh"

echo "Running Homebrew setup..."
"$SCRIPT_DIR/scripts/brew.sh"

echo "Running Git configuration..."
"$SCRIPT_DIR/scripts/git.sh"

echo "Running SSH setup..."
"$SCRIPT_DIR/scripts/setup-ssh.sh"

echo "Running Ghostty setup..."
"$SCRIPT_DIR/scripts/ghostty.sh"

echo "Creating Code directory..."
mkdir -p "$HOME/Code"

echo "Running Commit Confetti setup..."
"$SCRIPT_DIR/scripts/commit-confetti.sh"

echo "Installation complete! Please restart your terminal or run 'source ~/.zshrc'"
