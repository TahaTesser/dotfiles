# dotfiles

This is my dotfiles repository.

## install.sh

- Create SETUP_FLUTTER variable and set to false
- Check if zsh is installed
- Install oh-my-zsh
- Install Homebrew
- Install Brew packages (ghostty, gh, swiftformat, bruno, helix, neovim)
- Install VSCode configuration
- Configure Git user name and email
- Configure Git aliases:
  - `git kt`: Create empty commit to trigger tests
- Create .hushlogin file to disable login message
- Backup existing .zshrc if it exists
- Copy .zshrc to home directory
- Backup and update Oh My Zsh Flutter plugin
- Authenticate with GitHub CLI
- Generate SSH key if not already existing
- Check GitHub CLI is installed
- Authenticate with GitHub CLI
- Generate SSH key if not already existing
- Add SSH key to GitHub
- Set up Ghostty configuration (themes and config)
- Create Code directory
- Clone Flutter repository if SETUP_FLUTTER is true
- Print completion message

## .zshrc

This is my custom zsh configuration.

- Set oh-my-zsh as default shell
- Set apple theme
- Add plugins (git, flutter, alias-finder, gh, brew, helix, lazygit, neovim)
- Add JAVA environment variables
- Add Android environment variables
- Add Flutter environment variables
- Add Flutter source, sample and editor aliases
- Add API Keys for OpenAI and Anthropic

## .tmux.conf

This is my custom tmux configuration.

- Add TPM plugins (tpm, tmux-powerline, tmux-cpu, tmux-battery)
- Set mouse to on
- Set default terminal to tmux-256color
- Add catppuccin plugin
- Set status line to pretty and add some modules
- Add cpu and battery plugins

## ghostty/config

This is my custom ghostty configuration.

- Set theme to Apple System Colors
- Set font size to 18
- Set window height to 36
- Set window width to 110
- Set title to "Ghostty"
