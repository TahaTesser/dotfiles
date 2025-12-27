#!/bin/bash
# gh awt - Add worktree for PR or new branch
# Usage: gh awt <PR-number|branch-name>

set -e

id="$1"
base="../worktrees"

if [ -z "${id}" ]; then
  echo "Usage: gh awt <PR-number|branch-name>"
  echo "  PR number: Fetch PR and create branch pr-<number> in worktree"
  echo "  Branch name: Create new local branch in worktree"
  exit 1
fi

mkdir -p "${base}"

if printf "%s" "${id}" | grep -Eq "^[0-9]+$"; then
  branch="pr-${id}"
  dir="${base}/${branch}"
  action_type="PR #${id}"

  echo ""
  echo "📥 This will:"
  echo "   🔄 Fetch PR #${id} from origin"
  echo "   🌿 Create branch: ${branch}"
  echo "   📁 Create worktree at: ${dir}"
  echo ""

  read -p "❓ Proceed with fetching ${action_type}? (yes/no): " confirm
  if [ "$confirm" != "yes" ]; then
    echo "❌ Cancelled. Nothing was created."
    exit 0
  fi

  echo ""
  echo "📥 Fetching PR ${id} and creating worktree at ${dir} (branch ${branch})"
  git fetch origin "pull/${id}/head" || true

  if git worktree add -b "${branch}" "${dir}" FETCH_HEAD 2>/dev/null; then
    echo "✅ Worktree created at ${dir} (branch ${branch})"
  else
    if git rev-parse --verify "refs/remotes/origin/pr/${id}" >/dev/null 2>&1; then
      git worktree add -b "${branch}" "${dir}" "refs/remotes/origin/pr/${id}" \
        && echo "✅ Worktree created at ${dir} (branch ${branch})" \
        || echo "❌ Failed to create worktree for PR ${id}"
    else
      echo "❌ Failed to create worktree for PR ${id}"
    fi
  fi
else
  branch="${id}"
  dir="${base}/${branch}"
  action_type="branch '${branch}'"

  echo ""
  echo "🆕 This will:"
  echo "   🌿 Create new branch: ${branch}"
  echo "   📁 Create worktree at: ${dir}"
  echo ""

  read -p "❓ Proceed with creating ${action_type}? (yes/no): " confirm
  if [ "$confirm" != "yes" ]; then
    echo "❌ Cancelled. Nothing was created."
    exit 0
  fi

  echo ""
  echo "🆕 Creating new local branch '${branch}' in worktree ${dir}"

  if [ -d "${dir}" ]; then
    echo "❌ Error: Worktree directory ${dir} already exists"
    exit 1
  fi

  git worktree add -b "${branch}" "${dir}" HEAD \
    && echo "✅ Worktree created at ${dir} (new branch ${branch})" \
    || echo "❌ Failed to create worktree for new branch ${branch}"
fi
