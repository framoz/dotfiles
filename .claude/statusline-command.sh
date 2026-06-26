#!/usr/bin/env bash

input=$(cat)

# ANSI color codes
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
DIM='\033[2m'
RESET='\033[0m'

SEP="${DIM} | ${RESET}"

# Current folder
folder=$(echo "$input" | jq -r '.cwd' | xargs basename)

# Git branch (skip optional locks to avoid blocking)
git_branch=$(git -C "$(echo "$input" | jq -r '.cwd')" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)

# Context window usage
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // empty')

# Build output
output="${CYAN}${folder}${RESET}"

if [ -n "$git_branch" ]; then
  output="${output}${SEP}${GREEN}${git_branch}${RESET}"
fi

if [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  output="${output}${SEP}${YELLOW}ctx: ${used_int}%${RESET}"
fi

if [ -n "$model" ]; then
  output="${output}${SEP}${DIM}${model}${RESET}"
fi

printf "%b\n" "$output"
