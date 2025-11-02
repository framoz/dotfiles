# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository for managing Linux desktop environment configurations, specifically for Hyprland (Wayland compositor) and Rofi (application launcher). The repository uses a structured approach where configuration files are organized in subdirectories with their expected installation paths.

## Structure

The repository is organized by application:

- `hyprland/` - Hyprland window manager configuration
  - `.config/hypr/` - Main Hyprland config directory
    - `hyprland.conf` - Master configuration file that sources modular configs
    - `config/` - Modular configuration files
    - `hyprlock.conf` - Lock screen configuration
    - `hypridle.conf` - Idle management
    - `hyprpaper.conf` - Wallpaper management

- `rofi/` - Rofi application launcher configuration
  - `.config/rofi/config.rasi` - Rofi theming and behavior

## Hyprland Configuration Architecture

The Hyprland configuration uses a modular approach where `hyprland.conf` sources multiple specialized config files:

- `monitors.conf` - Display configuration and scaling
- `programs.conf` - Application variable definitions ($terminal, $browser, etc.)
- `autostart.conf` - Programs to launch at startup
- `env_variables.conf` - Environment variables
- `permissions.conf` - Permission settings
- `style.conf` - Visual appearance (gaps, borders, animations, blur)
- `input.conf` - Input device configuration
- `keybindings.conf` - Keyboard shortcuts and bindings
- `window-rules.conf` - Window-specific rules

### Key Application Variables (programs.conf)

- `$terminal = kitty $HOME` - Terminal defaults to home directory
- `$fileManager = nautilus`
- `$menu = rofi -show drun`
- `$browser = firefox`
- `$lockScreen = hyprlock`

### Important Keybindings

The main modifier key is `SUPER` (Windows key). Key bindings in `keybindings.conf`:
- `SUPER + Q` - Open terminal
- `SUPER + SPACE` - App launcher (Rofi)
- `SUPER + L` - Lock screen
- `SUPER + B` - Firefox (framoz profile)
- `SUPER + SHIFT + B` - Firefox (Stembers profile)
- `PRINT` - Screenshot region
- `SUPER + PRINT` - Screenshot full output

## Deployment

Configuration files in this repository mirror their target installation paths. To deploy:
- Files in `hyprland/.config/hypr/` should be linked/copied to `~/.config/hypr/`
- Files in `rofi/.config/rofi/` should be linked/copied to `~/.config/rofi/`

Common deployment method for dotfiles repositories is using GNU Stow or symlinks.

## Making Changes

When modifying Hyprland configuration:
1. Edit the appropriate modular config file in `hyprland/.config/hypr/config/` rather than the main `hyprland.conf`
2. Reload Hyprland to apply changes (typically `SUPER + SHIFT + R` or restart)
3. Test changes before committing

When modifying Rofi:
1. Edit `rofi/.config/rofi/config.rasi`
2. Test by launching Rofi (`SUPER + SPACE`)
