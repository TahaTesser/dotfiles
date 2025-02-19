#!/bin/bash

SETUP_FLUTTER=false  # Set this to true to include Flutter setup

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
brew install --cask ghostty
brew install gh
brew install swiftformat
brew install tmux
brew install bruno

# Set up VSCode configuration
echo "Setting up VSCode configuration..."
VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE_CONFIG_DIR"
cp -r ./VSCode/* "$VSCODE_CONFIG_DIR/"

# Set up Catppuccin for tmux
echo "Setting up Catppuccin for tmux..."
TMUX_CATPPUCCIN_DIR="$HOME/.tmux/plugins/catppuccin"
if [ ! -d "$TMUX_CATPPUCCIN_DIR" ]; then
    mkdir -p "$TMUX_CATPPUCCIN_DIR"
    git clone https://github.com/catppuccin/tmux.git "$TMUX_CATPPUCCIN_DIR/tmux"
else
    echo "Catppuccin for tmux already installed, skipping..."
fi

# Install TPM (Tmux Plugin Manager)
echo "Installing TPM..."
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM already installed, skipping..."
fi

# Copy and source tmux configuration
echo "Setting up tmux configuration..."
cp ./.tmux.conf "$HOME/.tmux.conf"
tmux source "$HOME/.tmux.conf" 2>/dev/null || echo "Note: tmux configuration will be applied next time you start tmux"

# Install TPM plugins
echo "Installing TPM plugins..."
~/.tmux/plugins/tpm/bin/install_plugins

# Configure Git global settings
echo "Setting up Git configuration..."
git config --global user.name "Taha Tesser"
git config --global user.email "tessertaha@gmail.com"

# Git aliases
git config --global alias.kt '!git commit --allow-empty -m "Kick tests"'
git config --global alias.find-wip '!git fsck --unreachable | grep commit | cut -d" " -f3 | xargs git log --merges --no-walk --grep=WIP'

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

# GitHub CLI setup
echo "Setting up GitHub CLI..."
if ! command -v gh >/dev/null 2>&1; then
    echo "GitHub CLI is not installed. Please install it and try again."
    exit 1
fi

# Check if already authenticated with GitHub CLI
if ! gh auth status >/dev/null 2>&1; then
    echo "Authenticating with GitHub CLI..."
    gh auth login
else
    echo "Already authenticated with GitHub CLI"
fi

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

# Set up GitHub CLI aliases
echo "Setting up GitHub CLI aliases..."
gh alias set prw 'pr list -A TahaTesser -w' --clobber

# Set up Ghostty configuration
echo "Setting up Ghostty configuration..."
GHOSTTY_CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p "$GHOSTTY_CONFIG_DIR"
cp ./ghostty/config "$GHOSTTY_CONFIG_DIR/config"
cp -r ./ghostty/themes "$GHOSTTY_CONFIG_DIR/themes"

# Create Code directory
echo "Creating Code directory..."
mkdir -p "$HOME/Code"

# Setup Commit Confetti
echo "Setting up Commit Confetti..."
# Clone this repository or download the setup_commit_confetti.sh script
git clone https://github.com/TahaTesser/CommitConfetti.git "$HOME/CommitConfetti"
cd "$HOME/CommitConfetti" || exit

# Make the script executable
chmod +x setup_commit_confetti.sh

# Run the setup script
./setup_commit_confetti.sh

# Clean up
cd "$HOME" || exit
rm -rf "$HOME/CommitConfetti"

if [ "$SETUP_FLUTTER" = true ]; then
    echo "Setting up Flutter..."
    cd "$HOME" || exit
    gh repo clone TahaTesser/flutter
fi

echo "Installation complete! Please restart your terminal or run 'source ~/.zshrc'"
