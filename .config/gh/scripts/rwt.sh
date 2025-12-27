#!/bin/bash
# gh rwt - Remove worktree and branch
# Usage: gh rwt <PR-number|branch-name>

set -e

id="$1"
base="../worktrees"

if [ -z "${id}" ]; then
  echo "Usage: gh rwt <PR-number|branch-name>"
  echo "  PR number: Remove worktree and branch pr-<number>"
  echo "  Branch name: Remove worktree and branch"
  exit 1
fi

if printf "%s" "${id}" | grep -Eq "^[0-9]+$"; then
  branch="pr-${id}"
  action_type="PR #${id}"
else
  branch="${id}"
  action_type="branch '${branch}'"
fi

dir="${base}/${branch}"

echo ""
echo "🗑️  WARNING: This will DELETE the following:"
echo "   📁 Worktree directory: ${dir}"
echo "   🌿 Branch: ${branch}"
echo ""

read -p "❓ Are you sure you want to remove ${action_type}? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
  echo "❌ Cancelled. Nothing was removed."
  exit 0
fi

echo ""
echo "🗑️  Removing worktree and branch: ${branch}"

# Try to locate registered worktree for the branch
wtpath=$(git worktree list --porcelain | grep -B1 "branch refs/heads/$branch" | sed -n "1s/^worktree //p")

if [ -n "$wtpath" ]; then
  echo "✅ Found registered worktree at $wtpath"
  git worktree remove "$wtpath" --force || echo "❌ failed to remove registered worktree at $wtpath"
else
  echo "🔍 No registered worktree found by search for $branch; trying candidate paths..."
  # Try repo-relative path first
  if git worktree remove "$dir" --force 2>/dev/null; then
    echo "✅ Removed registered worktree at $dir"
    wtpath="$dir"
  else
    # Try absolute path by resolving relative to repo pwd
    abs="$(pwd)/$dir"
    if git worktree remove "$abs" --force 2>/dev/null; then
      echo "✅ Removed registered worktree at $abs"
      wtpath="$abs"
    else
      echo "⚠️  Could not remove registered worktree by candidate paths (you can try: git worktree list --porcelain)"
    fi
  fi
fi

# Remove directory if still exists
if [ -d "$dir" ]; then
  echo "🗑️  Removing directory $dir"
  rm -rf "$dir"
fi

# Finally delete branch if present
if git show-ref --quiet "refs/heads/$branch"; then
  echo "🗑️  Deleting branch $branch"
  git branch -D "$branch"
else
  echo "ℹ️  Branch $branch does not exist"
fi

# Clean parent folder if empty
rmdir "$base" 2>/dev/null || true

echo "✅ Cleanup complete for ${id}"
