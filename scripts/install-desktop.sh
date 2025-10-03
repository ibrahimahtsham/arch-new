#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu --needed --noconfirm xorg-server xorg-xrandr xorg-xauth ly openbox kitty fontconfig ttf-dejavu ttf-liberation noto-fonts noto-fonts-emoji xorg-fonts-misc

sudo systemctl enable --now ly.service
echo "ly enabled"

# Rebuild the font cache so new fonts are immediately available to apps
sudo fc-cache -f
echo "font cache rebuilt"

# xorg-server is used for display server that is responsible for rendering graphics on the screen.
# xorg-xrandr is used for managing screen resolutions and orientations.
# xorg-xauth is used for authentication in X sessions.
# ly is a lightweight TUI display manager that allows users to log in to their graphical sessions.
# openbox is a highly configurable and lightweight window manager for the X Window System.
# kitty is a fast, feature-rich, GPU-based terminal emulator.
# fontconfig discovers and configures fonts for applications.
# ttf-dejavu, ttf-liberation, and noto-fonts provide widely-used TrueType fonts so UI text renders.
# noto-fonts-emoji adds emoji glyphs to avoid missing characters.
# xorg-fonts-misc provides legacy bitmap fonts (e.g., "fixed") some apps may fallback to.

# copy the openbox configuration files to the user's home directory in a folder called openbox-backup
mkdir -p "$HOME/openbox-config-backup"
cp -r /etc/xdg/openbox/* "$HOME/openbox-config-backup/"

