# dotfiles

This repository contains my personal dotfiles and development environment setup scripts.

## Quick Start

Run the complete setup:
```bash
./install.sh
```

Or run individual components:
```bash
./scripts/brew.sh           # Install Homebrew and packages
./scripts/git.sh            # Configure Git settings
./scripts/setup-ssh.sh      # Set up SSH keys
./scripts/vscode.sh         # Install VSCode configuration
./scripts/zsh.sh            # Set up Zsh and Oh My Zsh
./scripts/ghostty.sh        # Configure Ghostty terminal
./scripts/commit-confetti.sh # Install Commit Confetti
```

## Scripts Overview

### `install.sh`
Main installation script that orchestrates all individual setup scripts in the correct order.

### `scripts/brew.sh`
- Installs Homebrew (if not present)
- Installs packages: ghostty, gh (GitHub CLI), swiftformat
- Configures Homebrew PATH for Apple Silicon Macs

### `scripts/git.sh`
- Sets Git global user name and email (Taha Tesser)
- Configures Git aliases:
  - `git kt`: Create empty commit to trigger tests
  - `git find-wip`: Find orphaned WIP commits

### `scripts/setup-ssh.sh`
- Authenticates with GitHub CLI
- Generates ed25519 SSH key (if not existing)
- Adds SSH key to ssh-agent
- Registers SSH key with GitHub
- Can be used standalone for quick SSH setup

### `scripts/vscode.sh`
- Copies VSCode settings and snippets to user configuration directory

### `scripts/zsh.sh`
- Checks for zsh installation
- Installs Oh My Zsh
- Creates .hushlogin file to disable login message
- Backs up existing .zshrc
- Installs custom .zshrc configuration

### `scripts/ghostty.sh`
- Creates Ghostty configuration directory
- Downloads Catppuccin Mocha theme from official GitHub repository
- Sets up theme configuration

### `scripts/commit-confetti.sh`
- Clones and installs Commit Confetti for celebratory git commits
- Automatically cleans up temporary files

## Configuration Files

### VSCode
- Custom settings in `VSCode/settings.json`
- Dart snippets in `VSCode/snippets/dart.json`

### Zsh
- Custom `.zshrc` configuration with Oh My Zsh setup

### Ghostty
- Catppuccin Mocha theme downloaded automatically during setup
- No local theme files stored in repository

## What Gets Installed

- **Homebrew**: Package manager for macOS
- **Ghostty**: Terminal emulator with Catppuccin Mocha theme
- **GitHub CLI**: Command-line tool for GitHub
- **SwiftFormat**: Swift code formatter
- **Oh My Zsh**: Framework for managing Zsh configuration
- **VSCode**: Custom settings and Dart snippets
- **SSH Keys**: Ed25519 key pair for GitHub authentication
- **Git Configuration**: User settings and helpful aliases
- **Commit Confetti**: Fun celebration effects for git commits

## Requirements

- macOS (tested on Apple Silicon)
- Internet connection for downloading dependencies
- Zsh shell

## Notes

- All scripts can be run individually or as part of the complete setup
- Existing configurations are backed up before being replaced
- SSH key generation is skipped if keys already exist
- Homebrew installation is skipped if already installed