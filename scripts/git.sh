#!/bin/bash

echo "Setting up Git configuration..."

# Configure Git global settings
git config --global user.name "Taha Tesser"
git config --global user.email "48603081+TahaTesser@users.noreply.github.com"

# Git aliases
git config --global alias.kt '!git commit --allow-empty -m "Kick tests"'

echo "Git configuration complete!"
