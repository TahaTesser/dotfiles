#!/bin/bash

echo "Starting development environment setup..."

# Check if zsh is installed first, since it's a prerequisite
if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh is not installed. Please install zsh first and try again."
    exit 1
fi

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Check if Homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew is already installed"
fi

# Install required packages
echo "Installing packages..."
brew install gh
brew install swiftformat
brew install tmux
brew tap leoafarias/fvm
brew install fvm
brew install bruno

# Configure Git global settings
echo "Setting up Git configuration..."
git config --global user.name "Taha Tesser"
git config --global user.email "tessertaha@gmail.com"

# Create .hushlogin file to disable login message
echo "Creating .hushlogin file..."
touch "$HOME/.hushlogin"

# Set up zsh configuration
echo "Setting up zsh configuration..."

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Creating backup of existing .zshrc..."
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Copy the new .zshrc file
echo "Installing new .zshrc..."
cp ./.zshrc "$HOME/.zshrc"

# Create and setup flutter plugin
echo "Setting up flutter plugin..."
mkdir -p "$HOME/.oh-my-zsh/plugins/flutter"
cp ./flutter.plugin.zsh "$HOME/.oh-my-zsh/plugins/flutter/flutter.plugin.zsh"

# GitHub CLI setup
echo "Setting up GitHub CLI..."
if ! command -v gh >/dev/null 2>&1; then
    echo "GitHub CLI is not installed. Please install it and try again."
    exit 1
fi

# Authenticate with GitHub CLI
echo "Authenticating with GitHub CLI..."
gh auth login

# Generate SSH key if not already existing
SSH_KEY="$HOME/.ssh/id_ed25519"
if [ ! -f "$SSH_KEY" ]; then
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$(git config --global user.email || echo 'you@example.com')" -f "$SSH_KEY" -N ""
    
    # Start ssh-agent and add key
    eval "$(ssh-agent -s)"
    ssh-add "$SSH_KEY"
    
    # Add SSH key to GitHub
    echo "Adding SSH key to GitHub..."
    gh ssh-key add "$SSH_KEY.pub" -t "dotfiles-setup-key"
else
    echo "SSH key already exists at $SSH_KEY"
fi

# Set up Ghostty configuration
echo "Setting up Ghostty configuration..."
GHOSTTY_CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p "$GHOSTTY_CONFIG_DIR"
cp ./ghostty/config "$GHOSTTY_CONFIG_DIR/config"

echo "Installation complete! Please restart your terminal or run 'source ~/.zshrc'"
