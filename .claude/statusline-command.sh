#!/usr/bin/env bash

input=$(cat)

# ── Blade Runner palette (24-bit ANSI) ──
AMBER='\033[38;2;255;140;66m'   # #ff8c42 — signature
CREAM='\033[38;2;212;197;160m'  # #d4c5a0
CYAN='\033[38;2;108;196;212m'   # #6cc4d4
YELLOW='\033[38;2;230;180;80m'  # #e6b450
MUTED='\033[38;2;74;79;90m'     # #4a4f5a
RESET='\033[0m'

SEP="${MUTED} | ${RESET}"

# Current folder
folder=$(echo "$input" | jq -r '.cwd' | xargs basename)

# Git branch (skip optional locks to avoid blocking)
git_branch=$(git -C "$(echo "$input" | jq -r '.cwd')" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)

# Context window usage
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // empty')

# Build output
output="${AMBER}${folder}${RESET}"

if [ -n "$git_branch" ]; then
  output="${output}${SEP}${CYAN}${git_branch}${RESET}"
fi

if [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  output="${output}${SEP}${YELLOW}ctx: ${used_int}%${RESET}"
fi

if [ -n "$model" ]; then
  output="${output}${SEP}${MUTED}${model}${RESET}"
fi

printf "%b\n" "$output"
