#!/usr/bin/env bash
set -euo pipefail

# Install tint2
sudo pacman -Syu --needed --noconfirm tint2

# Backup existing user tint2 config
mkdir -p "$HOME/tint2-config-backup"
if [ -d "$HOME/.config/tint2" ]; then
	cp -r "$HOME/.config/tint2"/* "$HOME/tint2-config-backup/" || true
	echo "Backed up ~/.config/tint2 to $HOME/tint2-config-backup/"
fi

# Link repo tint2 config to ~/.config/tint2
rm -rf "$HOME/.config/tint2"
ln -s "$HOME/arch-openbox/tint2-configs" "$HOME/.config/tint2"
echo "Linked $HOME/arch-openbox/tint2-configs -> $HOME/.config/tint2"

