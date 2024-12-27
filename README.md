# dotfiles

This is my dotfiles repository.

- [install.sh](#install.sh)
- [.zshrc](#.zshrc)
- [flutter.plugin.zsh](#flutter.plugin.zsh)
- [ghostty/config](#ghostty/config)

## install.sh

- Check if zsh is installed
- Install oh-my-zsh
- Install Homebrew
- Install Brew packages (gh, swiftformat, tmux, fvm, bruno)
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
- Set up Ghostty configuration

## .zshrc

This is my custom zsh configuration.

- Set oh-my-zsh as default shell
- Set apple theme
- Add plugins
- Add Flutter aliases and editors aliases
- Add JAVA environment variables
- Add Android environment variables
- Add Flutter environment variables
- Flutter source, sample and editor aliases
- Add API Keys for OpenAI and Anthropic

## flutter.plugin.zsh

Updates the Flutter plugin for zsh for fvm.

## ghostty/config

This is my custom ghostty configuration.

- Set theme to Apple System Colors
- Set font size to 18
- Set window height to 36
- Set window width to 110
