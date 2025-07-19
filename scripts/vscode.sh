#!/bin/bash

echo "Setting up VSCode configuration..."

# Set up VSCode configuration
VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE_CONFIG_DIR"
cp -r ./VSCode/* "$VSCODE_CONFIG_DIR/"

echo "VSCode configuration complete!"