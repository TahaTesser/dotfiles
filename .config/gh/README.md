# GitHub CLI Configuration

This directory contains the GitHub CLI configuration files.

## File Structure

- `config.yml` - Main configuration with settings and aliases
- `hosts.yml` - Host-specific configuration
- `scripts/` - External scripts for complex aliases

## Aliases

Aliases are defined in `config.yml`. Complex logic lives in `scripts/` for maintainability.

### Available Aliases

| Alias | Description |
|-------|-------------|
| `co`  | `gh co <pr>` - Checkout a PR |
| `prw` | `gh prw` - List your PRs in browser |
| `awt` | `gh awt <id>` - Add worktree for PR or branch |
| `rwt` | `gh rwt <id>` - Remove worktree and branch |

### Worktree Aliases

**awt** (add worktree):
```bash
gh awt 123           # Fetch PR #123, create worktree at ../worktrees/pr-123
gh awt feature-name  # Create new branch in worktree at ../worktrees/feature-name
```

**rwt** (remove worktree):
```bash
gh rwt 123           # Remove worktree and branch pr-123
gh rwt feature-name  # Remove worktree and branch feature-name
```

Both include confirmation prompts for safety.

## Setup

Symlink or copy this directory to `~/.config/gh/`:

```bash
ln -sf ~/Code/dotfiles/.config/gh ~/.config/gh
```
