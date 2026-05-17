# Hyprland Configuration README

## Overview

This workspace contains a Hyprland configuration setup with a modular structure:

- hyprland.conf is the main Hyprland config entry point.
- colors.conf defines the color palette and wallpaper variables.
- battery-alert.sh is a helper script for battery notifications.
- hypridle.conf and hyprlock.conf contain idle/lockscreen settings.
- The configs directory holds modular Hyprland sub-configs for clean organization.

---

## Main Files

### hyprland.conf
- Main Hyprland configuration file.
- Defines reusable variables:
  - `$localbin`
  - `$hyprconfigs`
  - `$hyprshaders`
- Loads environment and session startup config:
  - `env.conf`
  - `startups.conf`
  - `monitors.conf`
  - keybinds.conf
- Sources the theme and feature configs:
  - colors.conf
  - general.conf
  - `rules.conf`
  - `input.conf`
  - `gestures.conf`
  - `layout.conf`
  - colors.conf (in configs)
  - `decoration.conf`
  - `animations.conf`
  - `misc.conf`
  - `plugins.conf`
- Starts `hypridle` once at session startup.

### colors.conf
- Defines theme colors and wallpaper.
- Contains RGBA values for:
  - `background`
  - `blue`, `cyan`, `green`, `magenta`, `orange`, etc.
  - `on_*` color variants for text/icon contrast.
- Sets image path via `$image`.

### battery-alert.sh
- Shell script for battery alerting.
- Likely used to monitor battery state and notify when low or critical.
- Should be executable and invoked by your session scripts or cron-style hooks.

### hypridle.conf
- Configuration for the idle daemon.
- Controls screen blanking, locking, and automatic idle behavior.
- Usually used by `hypridle` to start locking after inactivity.

### hyprlock.conf
- Locker configuration file.
- Defines the appearance and behavior of `hyprlock`.
- Typically includes wallpaper, colors, and lock screen settings.

---

## configs Directory

These files are modular Hyprland config pieces:
- `animations.conf`
  - Controls window animation settings and transition durations.
- colors.conf
  - Additional color definitions or theme overrides for the modular setup.
- `decoration.conf`
  - Window decoration styles, borders, and titlebar settings.
- `env.conf`
  - Environment variables and exported session settings.
- general.conf
  - Global compositor settings:
    - `gaps_in`
    - `gaps_out`
    - `gaps_workspaces`
    - `border_size`
    - `layout`
    - `allow_tearing`
    - `resize_on_border`
    - `no_focus_fallback`
- `gestures.conf`
  - Touch gestures and gesture-based actions.
- `input.conf`
  - Input device settings, pointer behavior, and keymappings.
- keybinds.conf
  - Keyboard and media bindings:
    - Workspace switching
    - Window movement
    - Floating/pseudo mode
    - App launchers
    - Audio controls
    - Brightness controls
    - Lock screen and session exit
- `layout.conf`
  - Workspace layout rules and split behavior.
- `misc.conf`
  - Miscellaneous settings not fitting other categories.
- `monitors.conf`
  - Display arrangement, monitor-specific configuration, scaling, and outputs.
- `plugins.conf`
  - Plugin or extension-related settings.
- `rules.conf`
  - Window rules and app-specific behaviors.
- `startups.conf`
  - Programs and commands launched when Hyprland starts.

---

## How It Works

1. hyprland.conf is the entry point.
2. It sources `env.conf`, `startups.conf`, `monitors.conf`, and keybinds.conf first.
3. It then loads theme and behavior configs from the configs directory.
4. `hypridle` is launched once with `exec-once = hypridle &`.

---

## Notes

- This setup is intentionally modular and easy to maintain.
- To update a specific behavior, edit the relevant file in configs.
- Keep hyprland.conf minimal; use it mainly to compose the other configs.
- Ensure battery-alert.sh is executable if you want alerts to work properly.
