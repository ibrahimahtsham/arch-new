#!/usr/bin/env bash
set -euo pipefail

# get discord from yay
yay -Syu --needed --noconfirm discord
echo "discord updated"