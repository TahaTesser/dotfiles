# dotfiles

Personal dotfiles and helper scripts for bootstrapping my macOS development environment.

## Quick Start

Run the complete setup:
```bash
./install.sh
```

Or run individual components:
```bash
./scripts/brew.sh           # Install Homebrew (if needed) and CLI tools
./scripts/git.sh            # Configure Git settings
./scripts/setup-ssh.sh      # Generate SSH keys and register with GitHub
./scripts/zsh.sh            # Install Oh My Zsh and copy .zshrc
./scripts/ghostty.sh        # Configure Ghostty and Catppuccin theme
./scripts/commit-confetti.sh # Install Commit Confetti
```

## Scripts Overview

### `install.sh`
Main installation script that orchestrates all individual setup scripts in the correct order.

### `scripts/brew.sh`
- Installs Homebrew if it's not already available
- Adds Homebrew to the PATH on Apple Silicon machines
- Installs core CLI tooling (`gh`, `go`) and the Temurin 17 JDK cask

### `scripts/git.sh`
- Sets Git global user name and email (Taha Tesser)
- Adds a `kt` alias for creating an empty "Kick tests" commit

### `scripts/setup-ssh.sh`
- Ensures Git global identity matches the repository defaults
- Generates an ed25519 SSH key when one is not already present
- Adds the key to `ssh-agent`
- Uploads the key to GitHub if the GitHub CLI is available, otherwise prints instructions

### `scripts/zsh.sh`
- Verifies `zsh` is installed before continuing
- Installs Oh My Zsh
- Creates `.hushlogin` to silence the login banner
- Backs up any existing `.zshrc` and installs the repository version

### `scripts/ghostty.sh`
- Copies the bundled Ghostty config into `~/Library/Application Support/com.mitchellh.ghostty`
- Downloads Catppuccin Ghostty themes and installs the Mocha theme into `~/.config/ghostty/themes`

### `scripts/commit-confetti.sh`
- Clones the Commit Confetti repository
- Runs its setup script
- Removes the temporary checkout once installation finishes

## Configuration Files

### `.zshrc`
- Configures Oh My Zsh with the `apple` theme and `git`/`gh` plugins
- Sets `JAVA_HOME` to the Homebrew Temurin 17 JDK and exports Android SDK, Go, and NVM paths
- Provides placeholders for OpenAI and Anthropic API keys

### `ghostty/config`
- Points Ghostty at the Catppuccin Mocha theme
- Sets JetBrainsMono Nerd Font at size 18

### `gh/`
- GitHub CLI configuration and aliases
- `aliases.yml` - Custom aliases (awt, rwt) for managing git worktrees
- `config.yml` - Main GitHub CLI configuration
- `hosts.yml` - Host-specific GitHub settings
- `sync-aliases.sh` - Helper script to sync aliases from aliases.yml
- See `gh/README.md` for detailed documentation

## What Gets Installed

- **Homebrew** (if missing) along with the GitHub CLI (`gh`), Go toolchain (`go`), and Temurin 17 JDK (`temurin@17`)
- **Git Configuration**: Global name/email and a `kt` alias for empty commits
- **SSH Keys**: Ed25519 key pair and optional GitHub registration
- **Zsh Setup**: Oh My Zsh plus the repository `.zshrc`
- **Ghostty Theme**: Catppuccin Mocha applied to the local Ghostty config
- **Commit Confetti**: Celebratory git hooks via the upstream installer

## Requirements

- macOS (tested on Apple Silicon)
- Internet connection for downloading dependencies
- Zsh shell

## Notes

- All scripts can be run individually or as part of the complete setup
- Existing configurations are backed up before being replaced
- SSH key generation is skipped if keys already exist
- Homebrew installation is skipped if already installed
