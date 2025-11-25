# GitHub CLI Configuration

This directory contains the GitHub CLI configuration files.

## File Structure

- `config.yml` - Main GitHub CLI configuration file
- `aliases.yml` - Separate file containing alias definitions (easier to manage and version control)
- `sync-aliases.sh` - Helper script to sync aliases from aliases.yml to GitHub CLI
- `hosts.yml` - Host-specific configuration

## Managing Aliases

### Editing Aliases

Edit aliases in `aliases.yml` - this is the source of truth for your aliases.

### Syncing Aliases

After editing `aliases.yml`, sync them to GitHub CLI:

```bash
# Option 1: Use the helper script
./sync-aliases.sh

# Option 2: Use gh directly
gh alias import aliases.yml
```

### Current Aliases

- **awt** (add worktree) - Create a worktree for a PR or branch
  - `gh awt 123` - Fetch PR #123 and create worktree with branch `pr-123`
  - `gh awt feature-branch` - Create new local branch `feature-branch` in worktree

- **rwt** (remove worktree) - Remove a worktree and branch
  - `gh rwt 123` - Remove worktree and branch `pr-123`
  - `gh rwt feature-branch` - Remove worktree and branch `feature-branch`

Both aliases include confirmation prompts for safety.

## Workflow

1. Edit `aliases.yml` to add/modify aliases
2. Run `./sync-aliases.sh` to import changes
3. Aliases are now available via `gh` commands

Note: GitHub CLI stores aliases in `config.yml` after import, but `aliases.yml` remains the source of truth for easier management.

