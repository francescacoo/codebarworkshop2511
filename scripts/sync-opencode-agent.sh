#!/usr/bin/env bash
# Rebuilds .opencode/agents/iris-job-agent.md from .claude/agents/iris-job-agent.md.
# The instructions (the text below the frontmatter) are copied unchanged.
# Only the frontmatter differs, because Claude Code and opencode name things differently.
# Run from the project root:  bash scripts/sync-opencode-agent.sh
set -euo pipefail
SRC=".claude/agents/iris-job-agent.md"
DST=".opencode/agents/iris-job-agent.md"
[ -f "$SRC" ] || { echo "Run this from the project root (can't find $SRC)"; exit 1; }
mkdir -p "$(dirname "$DST")"
{
cat <<'HEADER'
---
description: Personal job-search assistant for Iris, who is moving from Berlin to Brooklyn and changing careers into early childhood education. Finds job offers, finds contact people, adapts and translates her documents, designs them as PDF and Word, and tracks her applications. Use for anything related to Iris's job search.
mode: primary
color: "#ff6f3c"
permission:
  read: allow
  glob: allow
  grep: allow
  skill: allow
  webfetch: allow
  websearch: allow
  edit:
    "*": allow
    "profile/**": deny
  bash:
    "*": ask
---
HEADER
# copy everything after the closing --- of the Claude Code frontmatter
awk 'BEGIN{n=0} n>=2{print} /^---[[:space:]]*$/{n++}' "$SRC"
} > "$DST"
echo "Wrote $DST"
