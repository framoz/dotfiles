# CLI Tools Cheatsheet

## eza (ls replacement)

Aliased in `.bashrc` — just use `ls` as normal.

```bash
ls              # list files with icons
ll              # list all files, long format
lt              # tree view (2 levels deep)
eza -la --git   # show git status per file
```

## bat (cat replacement)

Aliased in `.bashrc` — just use `cat` as normal.

```bash
cat file.py        # plain output (no line numbers)
catn file.py       # full output with line numbers + syntax highlighting
bat -l json        # force a specific language for highlighting
bat --diff file.py # show git diff inline
```

## fzf (fuzzy finder)

Interactive fuzzy search. Tokyonight colors are set via FZF_DEFAULT_OPTS.

```bash
# Search files
fzf                          # browse and pick a file
vim $(fzf)                   # open a file in vim
cat $(fzf)                   # preview and cat a file

# Search inside files
grep -r "pattern" | fzf      # filter grep results interactively

# History search
Ctrl+R                       # fuzzy search command history (built-in)

# Change directory
Alt+C                        # fuzzy cd into a subdirectory

# Piping
ps aux | fzf                 # filter any command output
pacman -Qq | fzf --preview 'pacman -Qi {}'  # browse installed packages
```

## zoxide (smarter cd)

Learns directories you visit. Use `z` instead of `cd`.

```bash
z dotfiles          # jump to ~/dotfiles (or best match)
z hypr              # jump to most visited dir matching "hypr"
z conf hypr         # match multiple keywords: ~/.config/hypr
zi                  # interactive selection with fzf
cd /some/long/path  # still works, zoxide learns it
z -                 # go back to previous directory
```

**Tip:** Just use `z` everywhere instead of `cd`. It gets smarter over time.

## starship (prompt)

Shows current directory, git branch/status, and language versions automatically.
Config is at `~/.config/starship.toml`.

- Blue `❯` = last command succeeded
- Red `❯` = last command failed
- Git info appears automatically in repos
- Language versions (Python, Node, Rust, Java) appear when relevant files are detected

## cliphist (clipboard history)

Runs in the background, stores everything you copy.

```bash
Super + V           # open clipboard history in rofi, pick to paste
cliphist list       # list clipboard entries in terminal
cliphist wipe       # clear all clipboard history
```

**Note:** `Super + Shift + V` is now toggle floating (was `Super + V`).
