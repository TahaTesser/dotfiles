#!/bin/bash

echo "Setting up Ghostty configuration..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Set up Ghostty configuration
GHOSTTY_CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p "$GHOSTTY_CONFIG_DIR"

# Copy main config from dotfiles
echo "Copying Ghostty config from dotfiles..."
cp "$DOTFILES_DIR/ghostty/config" "$GHOSTTY_CONFIG_DIR/config"

# Clone catppuccin ghostty themes
echo "Installing Catppuccin themes for Ghostty..."
git clone https://github.com/catppuccin/ghostty.git /tmp/catppuccin-ghostty
GHOSTTY_THEME_DIR="$HOME/.config/ghostty/themes"
mkdir -p "$GHOSTTY_THEME_DIR"
cp /tmp/catppuccin-ghostty/themes/catppuccin-mocha.conf "$GHOSTTY_THEME_DIR/"
rm -rf /tmp/catppuccin-ghostty

echo "Ghostty configuration complete!"
