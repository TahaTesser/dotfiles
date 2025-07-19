#!/bin/bash

echo "Setting up zsh configuration..."

# Check if zsh is installed first, since it's a prerequisite
if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh is not installed. Please install zsh first and try again."
    exit 1
fi

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create .hushlogin file to disable login message
echo "Creating .hushlogin file..."
touch "$HOME/.hushlogin"

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Creating backup of existing .zshrc..."
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Copy the new .zshrc file
echo "Installing new .zshrc..."
cp ./.zshrc "$HOME/.zshrc"

echo "zsh setup complete!"