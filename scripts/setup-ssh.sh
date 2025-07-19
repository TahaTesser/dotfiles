#!/bin/bash

# Minimal SSH key setup script
# Based on install.sh SSH configuration

echo "Setting up SSH key..."

# Set Git user info
git config --global user.name "Taha Tesser"
git config --global user.email "48603081+TahaTesser@users.noreply.github.com"

# Generate SSH key if not already existing
SSH_KEY="$HOME/.ssh/id_ed25519"
if [ ! -f "$SSH_KEY" ]; then
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "48603081+TahaTesser@users.noreply.github.com" -f "$SSH_KEY" -N ""
    
    # Start ssh-agent and add key
    eval "$(ssh-agent -s)"
    ssh-add "$SSH_KEY"
    
    # Add SSH key to GitHub (requires gh CLI)
    if command -v gh >/dev/null 2>&1; then
        echo "Adding SSH key to GitHub..."
        gh ssh-key add "$SSH_KEY.pub" -t "ssh-setup-key"
    else
        echo "GitHub CLI not found. Please manually add the SSH key to GitHub:"
        echo "Key location: $SSH_KEY.pub"
        cat "$SSH_KEY.pub"
    fi
else
    echo "SSH key already exists at $SSH_KEY"
fi

echo "SSH setup complete!"