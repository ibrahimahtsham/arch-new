#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu --needed --noconfirm xorg-server xorg-xrandr xorg-xauth ly openbox kitty

sudo systemctl enable --now ly.service

# xorg-server is used for display server that is responsible for rendering graphics on the screen.
# xorg-xrandr is used for managing screen resolutions and orientations.
# xorg-xauth is used for authentication in X sessions.
# ly is a lightweight TUI display manager that allows users to log in to their graphical sessions.
# openbox is a highly configurable and lightweight window manager for the X Window System.
# kitty is a fast, feature-rich, GPU-based terminal emulator.